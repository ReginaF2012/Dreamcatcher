class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user
    helper_method :logged_in? 
    helper_method :set_user
    helper_method :require_login
    helper_method :set_dreams
  
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
    
    def set_dreams
        if @user
          if @user == current_user
            @dreams = @user.dreams
          else 
            @dreams = @user.dreams.made_public
          end
        else
          @dreams = Dream.all.made_public
        end
    end
end
