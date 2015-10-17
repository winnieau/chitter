require 'dm-timestamps'

class Peep
  include DataMapper::Resource
  property :id, Serial
  property :content, String
  property :timestamp, DateTime
  
  belongs_to :user
end
