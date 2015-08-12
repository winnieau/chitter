require "bcrypt"

class User
  include Datamapper::Resource

    property :id, Serial
    property :email, String

    property :password_digest, Text

    def password=(password)
      self.password_digest = Bcrypt::Password.create(password)
    end
  end
