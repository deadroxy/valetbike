class ApplicationController < ActionController::Base

    before_action :set_current_user


    helper_method :current_user, :logged_in?
    
    def set_current_user
        if session[:user_id]
            Current.user = User.find_by(id: session[:user_id])
        end
    end

    def require_user_log_in!
        redirect_to login_path, alert: "You must be signed in to do that." if Current.user.nil?
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
 
    def logged_in?
        !!current_user
    end
 
    def require_user
        if !logged_in?
            flash[:alert] = "You must be logged in to perform that action."
            redirect_to login_path
        end
    end
end
