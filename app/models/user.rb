class User < ApplicationRecord
    has_many :dreams, dependent: :destroy
    has_many :symbolisms, through: :dreams
    has_secure_password
end
