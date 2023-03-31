require "sinatra/base"
require "sinatra/activerecord"
require "bcrypt"
require "erb"
require_relative "lib/post"
require_relative "lib/user"

class Application < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  get "/" do
    @posts = Post.all
    erb(:index)
  end

  get "/sign-up" do
    erb(:sign_up)
  end

  post "/users" do
    encrypted_password = BCrypt::Password.create(params["password"])
    user = User.new(
      "email": params["email"],
      "password_digest": encrypted_password,
      "real_name": params["real_name"],
      "username": params["username"]
    )
    user.save
  end
end