require 'data_mapper'
require 'dm-validations'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_users_#{env}")

require './app/models/user'

DataMapper.finalize

DataMapper.auto_upgrade!
