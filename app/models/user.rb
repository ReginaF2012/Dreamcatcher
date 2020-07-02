class User < ApplicationRecord
    has_many :dreams, dependent: :destroy
    has_many :symbolisms, through: :dreams
    has_secure_password

    def self.find_or_create_by_auth_hash(auth_hash)
        #see if user is already in the database
        if user = self.find_by(email: auth_hash['info']['email'])
            user
        else
            #create a new user
            user = self.new(email: auth_hash['info']['email'], password: SecureRandom.hex)
            user.save
            user
        end
    end
end
