class User < ApplicationRecord
    validates :username, presence: :true, uniqueness: :true
    validates :email, presence: :true, uniqueness: :true
    has_many :dreams, dependent: :destroy
    has_many :symbolisms, through: :dreams
    has_secure_password

    def self.find_or_create_by_auth_hash(auth_hash)
        if self.find_by(email: auth_hash['info']['email']) 
            self.find_by(email: auth_hash['info']['email'])
        else 
            username = self.find_unique_username(auth_hash['info']['name'])
            self.create(email: auth_hash['info']['email'], username: username, password: SecureRandom.hex)
        end
    end

    # https://alexcastano.com/generate-unique-usernames-for-ruby-on-rails/
    # ^^^ Link to where I found inspiration for this method ^^^
    def self.find_unique_username(name)
        username = name.parameterize(separator: '_')
        taken_usernames = User.where("username LIKE ?", "#{username}%").pluck(:username)

        count = 1
        while taken_usernames.include?(username)
            username = name.parameterize(separator: '_')
            username = "#{username}_#{count}"
            count += 1
        end
        username
      end

end
