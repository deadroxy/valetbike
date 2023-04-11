class ApplicationController < ActionController::Base
    
    private
    def set_time_zone
      Time.use_zone(current_user.timezone) { yield }
    end

    def after_sign_out_path_for(resource_or_scope)
      root_path
    end
    
    # def after_sign_in_path_for(resource)
    #   if current_user.admin?
    #     admin_dashboard_path
    #   else
    #     root_path
    #   end
    # end
    

   

end
