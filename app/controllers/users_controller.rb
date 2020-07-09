class UsersController < ApplicationController
    before_action :require_login, only: [:show]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params(:username, :email, :password, :password_confirmation))
        if @user.save
            session["user_id"] = @user.id
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    def show
        if @user = User.find_by(id: params[:id])
            set_dreams
            render 'show'
        else
            redirect_to root_path
        end
    end

    private

    def user_params(*args)
        params.require(:user).permit(*args)
    end
end