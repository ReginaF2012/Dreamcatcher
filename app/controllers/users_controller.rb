class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params(:username, :email, :password))
        if @user.save && params[:user][:password] == params[:user][:password_confirmation]
            session["user_id"] = @user.id
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    def show
    end

    private

    def user_params(*args)
        params.require(:user).permit(*args)
    end
    
end