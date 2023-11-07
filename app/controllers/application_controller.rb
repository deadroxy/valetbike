class ApplicationController < ActionController::Base
    #declare as helper so accessable to all views
    helper_method :current_user
    helper_method :logged_in? 
    before_action :require_login

    def logged_in?
        session[:user_id] 
    end    

    def require_login
        #if !logged_in?
         #   redirect_to login_path
        #end
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if 
        session[:user_id]
    end
end
