class DreamsController < ApplicationController

    def index
    end

    def new
        @dream = Dream.new
        5.times do 
          @dream.symbolisms.build
        end
    end


    def create
        byebug
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
        params.require(:user).permit(*args)
    end

end