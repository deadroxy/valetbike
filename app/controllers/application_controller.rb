class ApplicationController < ActionController::Base
    
    private
    def set_time_zone
      Time.use_zone(current_user.timezone) { yield }
    end

    def after_sign_out_path_for(resource_or_scope)
      root_path
    end
    
   

end
