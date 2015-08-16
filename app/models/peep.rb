require 'factory_girl'

class Peep
  attr_accessor :peep
  include DataMapper::Resource
  property :id, Serial
  property :content, String
end
