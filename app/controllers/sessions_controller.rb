class SessionsController < ApplicationController

    def new
    end

    def create
        #If the user is logging in via omniauth
        if auth_hash = request.env['omniauth.auth']
            @user = User.find_or_create_by_auth_hash(auth_hash)
            session['user_id'] = @user.id
            redirect_to user_path(@user)
        else

        end
    end

    def destroy
    end
    
end