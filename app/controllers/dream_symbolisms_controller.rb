class DreamSymbolismsController < ApplicationController
    before_action :require_login, only: [:new, :edit, :destroy]

    
    def index
    end
    
    def show
    end

    def new
        @num = params[:number].to_i
        @user = User.find_by(id: params[:user_id])
        @dream = Dream.find_by(id: params[:dream_id])
        @num.times { @dream.dream_symbolisms.build}
    end

    def create

    end

    def edit
    end

    def update
    end

    def destroy
    end

    private
    
    def dream_symbolism_params(*args)
    end
end