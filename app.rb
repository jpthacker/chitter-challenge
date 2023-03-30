require "sinatra/base"
require "sinatra/activerecord"
require "bcrypt"

class Chitter < Sinatra::Base
  register Sinatra::ActiveRecordExtension
end