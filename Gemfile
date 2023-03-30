source 'https://rubygems.org'

ruby '3.0.2'

group :test do
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end

group :development, :test do
  gem 'rubocop', '1.20'
end

gem "pg", "~> 1.4"

gem 'rake'
gem 'activerecord'
gem "sinatra" # self-explanatory
gem "sinatra-activerecord" # so it works with Sinatra
gem "bcrypt" # password encryption