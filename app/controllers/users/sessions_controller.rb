class Users::SessionsController < Devise::SessionsController
    protected
    def after_sign_in_path_for(resource)
      locations_path
    end
    def login
    end
  end
  