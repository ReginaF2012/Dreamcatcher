class DreamsController < ApplicationController
    before_action :require_login, except: [:show, :index ]
    before_action :set_dream, except: [:index, :new ]
    before_action :check_user, only: [:edit, :update, :destroy]

    def index
        params[:user_id] && @user = User.find_by(id: params[:user_id])
        set_dreams
    end

    def new
        @dream = Dream.new
    end



    def create
        @dream = Dream.new(dream_params(:user_id, :title, :content, :dream_type, :is_public))
        if @dream.save
            redirect_to user_dream_path(current_user, @dream)
        else
            render 'new'
        end
    end

    def show
        @dream_symbolisms = @dream.dream_symbolisms
        if @dream.is_public? || @dream.user == current_user
            render 'show'
        else
            flash[:error] = "Sorry that page is private!"
            redirect_to dreams_path
        end
    end

    def edit
    end
    
    def update
        if @dream.update(dream_params(:title, :content, :is_public, :dream_type))
            redirect_to user_dream_path(current_user, @dream)
        else
            render 'edit'
        end
    end

    def destroy
        @dream.destroy
        redirect_to user_path(current_user)
    end

    private

    def dream_params(*args)
        params.require(:dream).permit(*args)
    end

    def set_dream
        @dream = Dream.find_by(id: params[:id])
    end

    def check_user
        unless current_user == @dream.user
            flash[:error] = "Invalid Input"
            redirect_to root_path
        end
    end

end