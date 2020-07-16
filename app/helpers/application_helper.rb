module ApplicationHelper
  
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end
  
    def logged_in?
      !!session[:user_id]
    end
  
    def set_user
      @user = current_user
    end
   
    def require_login
      unless logged_in?
        flash[:error] = "You must be logged in to access this section"
        redirect_to login_path
      end
    end
    
    # This is used in the DreamsController && the UsersController, hence why I assigned it as a helper method
    #  and not a private method in the DreamController
    def set_dreams
      # If there is a user coming from the pararams (/users/:id)
        if @user
          # If the user is the current_user
          if @user == current_user
            # The dreams that should go to the view are all of the dreams belonging to that user
            @dreams = @user.dreams.order('created_at DESC')
          else 
            # There is a user but it is not the current_user, so the dreams should only be that user's public dreams
            @dreams = @user.dreams.made_public.order('created_at DESC')
          end
        else
          # No user, dreams are all public dreams
          @dreams = Dream.all.made_public.order('created_at DESC')
        end
    end
end
