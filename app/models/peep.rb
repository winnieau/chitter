require 'dm-timestamps'

class Peep
  include DataMapper::Resource
  property :id, Serial
  property :content, String
  timestamps :at, DateTime
end
