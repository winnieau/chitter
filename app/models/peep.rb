require 'factory_girl'

class Peep
  attr_reader :content
  include DataMapper::Resource
  property :id, Serial
  property :peep, String
end
