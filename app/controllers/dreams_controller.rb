class DreamsController < ApplicationController

    def index
    end

    def new
        @dream = Dream.new(user: current_user)
    end

    def create
    end

    def show
    end

    def edit
    end
    
    def update
    end

    def destroy
    end

end