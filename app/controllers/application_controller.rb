class ApplicationController < ActionController::Base
    ActionController::Base
    helper_method :logged_in?
    helper_method :current_user
    
    
    def current_user
        User.find_by(id: session[:user_id])
    end

    def logged_in?
        # byebug
        !current_user.nil? #not the case the the current user  
    end

    def authorized
        redirect_to '/index' unless logged_in?
     end
     def show
     end
end
