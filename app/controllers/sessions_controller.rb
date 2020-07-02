class SessionsController < ApplicationController

    def new
    end

    def create
        #If the user is logging in via omniauth
        if auth_hash = request.env['omniauth.auth']
            #see if user is already in the database
            if user = User.find_by(email: auth_hash['info']['email'])
                #log them in
                session['user_id'] = user.id
                redirect_to user_path(user)
            else
                #create a new user
                user = User.new(email: auth_hash['info']['email'], password: SecureRandom.hex)
                user.save
                session['user_id'] = user.id
                redirect_to user_path(user)
            end
        else

        end
    end

    def destroy
    end
    
end