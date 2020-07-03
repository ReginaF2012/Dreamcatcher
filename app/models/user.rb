class User < ApplicationRecord
    validates :username, presence: :true, uniqueness: :true
    validates :email, presence: :true, uniqueness: :true
    has_many :dreams, dependent: :destroy
    has_many :symbolisms, through: :dreams
    validates :password_confirmation, presence: true
    has_secure_password

    def self.find_or_create_by_auth_hash(auth_hash)
        #If the user is already in the db
        if self.find_by(email: auth_hash['info']['email']) 
            #return the user
            self.find_by(email: auth_hash['info']['email'])
        else 
            #creating a username to assign to new user
            username = self.find_unique_username(auth_hash['info']['name'])
            #create and return new user
            self.create(email: auth_hash['info']['email'], username: username, password: SecureRandom.hex)
        end
    end

    # https://alexcastano.com/generate-unique-usernames-for-ruby-on-rails/
    # ^^^ Link to where I found inspiration for this method ^^^
    def self.find_unique_username(name)
        username = name.parameterize(separator: '_')
        #An array of usernames similar to the parameterized version of the name 
        # e.g; name = "John Doe", this might return ["john_doe", "john_doe_1", "john_doe44"]
        taken_usernames = User.where("username LIKE ?", "#{username}%").pluck(:username)

        count = 1
        #If the username is identical to one of the names in the database loop until a unique name is found
        while taken_usernames.include?(username)
            #reseting the username because I only want to add _#{count} to the end, without this username
            #would start to look like "user_1_2" "user_1_2_3" ect...
            username = name.parameterize(separator: '_')
            username = "#{username}_#{count}"
            count += 1
        end
        username
      end

end
