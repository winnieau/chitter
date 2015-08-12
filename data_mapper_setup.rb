require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV["DATABASE_URL"] || "postgres://localhost/chitter_users")

require './app/models/user'

DataMapper.finalize

DataMapper.auto_upgrade!
