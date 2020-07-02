class User < ApplicationRecord
    has_many :dreams, dependent: :destroy
    has_many :symbolisms, through: :dreams
    has_secure_password

    def self.find_or_create_by_auth_hash(auth_hash)
        user = self.find_by(email: auth_hash['info']['email']) ? user :  self.create(email: auth_hash['info']['email'], password: SecureRandom.hex)
    end
end
