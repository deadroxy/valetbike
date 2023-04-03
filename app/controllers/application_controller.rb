class ApplicationController < ActionController::Base
    
    private
    def set_time_zone
      Time.use_zone(current_user.timezone) { yield }
    end
end
