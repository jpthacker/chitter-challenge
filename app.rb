require "sinatra/base"
require "sinatra/activerecord"
require "bcrypt"
require "erb"
require_relative "lib/post"
require_relative "lib/user"

class Application < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  get "/" do
    @users = User.all
    @posts = Post.all
    erb(:index)
  end
end