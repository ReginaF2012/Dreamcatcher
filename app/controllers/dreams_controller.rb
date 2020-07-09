class DreamsController < ApplicationController
    before_action :set_dream, only: [:show, :edit]

    def index
    end

    def new
        @dream = Dream.new
    end


    def create
        @dream = Dream.new(dream_params(:user_id, :title, :content, :dream_type, :public))
        if @dream.save
            redirect_to user_dream_path(current_user, @dream)
        else
            render 'new'
        end
    end

    def show
    end

    def edit
    end
    
    def update
    end

    def destroy
    end

    private

    def dream_params(*args)
        params.require(:dream).permit(*args)
    end

    def set_dream
        @dream = Dream.find_by(id: params[:id])
    end

end