class DreamSymbolismsController < ApplicationController
    before_action :require_login
    before_action :set_dream_symbolism, only: [:edit, :update, :destroy]
    before_action :check_user, only: [:edit, :update, :destroy]
    before_action :set_dream, except: [:edit]

    def new
        @num = params[:number].to_i
    end

    def create
        # I didn't pass in a model to the new form, as I wanted the user to be able to select how many instances of a 
        # dream symbolism they would be creating, this made it so I had to manually write out the form field names
        # and they came through params in an unconventional way 
        dream_symbolism_attrs = params.require(:dream_symbolisms).permit(instances: [:symbolism_id, :meaning, :dream_id, symbolism_attributes: [:name]]).fetch(:instances)
        dream_symbolism_attrs.each do |ds_attr|
            @dream_symbolism = DreamSymbolism.create(ds_attr)
            # since the form isn't based on a model, I passed the errors messages to flash messages to be displayed
            # after they are redirected, these instances of dream symbolism are not actually created due to failing validations
            flash[:error] = @dream_symbolism.errors.full_messages if @dream_symbolism.errors.any?
        end
        redirect_to user_dream_path(@dream.user, @dream)
    end

    def edit
    end

    def update
        if @dream_symbolism.update(dream_symbolism_params(:meaning, :symbolism_id, symbolism_attributes: [:name]))
            redirect_to user_dream_path(@dream.user, @dream_symbolism.dream)
        else
            render 'edit'
        end
    end

    def destroy
        @dream_symbolism.destroy
        redirect_to user_dream_path(@dream.user, @dream )
    end

    private

    def set_dream_symbolism
        @dream_symbolism = DreamSymbolism.find_by(id: params[:id])
    end
    
    def dream_symbolism_params(*args)
        params.require(:dream_symbolism).permit(*args)
    end

    def set_dream
        @dream = Dream.find_by(id: params[:dream_id])
    end

    def check_user
        unless current_user == @dream_symbolism.dream.user
            flash[:error] = "Invalid Input"
            redirect_to root_path
        end
    end
end