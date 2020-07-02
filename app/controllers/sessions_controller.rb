class SessionsController < ApplicationController

    def new
        #if a user is already logged in redirect them
        if logged_in?
            redirect_to root_path
        else
            render 'new'
        end
    end

    def create
        #If the user is logging in via omniauth
        if auth_hash = request.env['omniauth.auth']
            @user = User.find_or_create_by_auth_hash(auth_hash)
            log_in
        else
            #byebug
            @user =  User.find_by(email: params[:email])
            if @user.authenticate(params[:password])
                log_in
            else
                render 'new'
            end
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end

    private

    def log_in
        session['user_id'] = @user.id
        redirect_to user_path(@user)
    end
    
end