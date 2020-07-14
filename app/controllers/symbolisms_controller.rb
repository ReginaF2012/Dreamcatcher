class SymbolismsController < ApplicationController
    
    def index
        if @user = User.find_by(id: params[:user_id])
            @symbolisms = @user.symbolisms
        else
            @symbolisms = Symbolism.all
        end
    end

    def show
        @symbolism = Symbolism.find_by(id: params[:id])
    end

end