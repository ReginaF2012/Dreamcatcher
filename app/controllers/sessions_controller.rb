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
            #if the user can be found in the db via email
            if @user =  User.find_by(email: params[:email])
                #authenticate
                if @user.authenticate(params[:password])
                    log_in
                #found via email but can't authenticate with password
                else
                    flash[:alert] = "incorrect password"
                    redirect_to login_path
                end
            else
                flash[:alert] = "incorrect email"
                #can't find via email
                redirect_to login_path
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