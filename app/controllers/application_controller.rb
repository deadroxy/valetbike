class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_stripe_key 

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :password, :dob])
    end

    private 
    def set_stripe_key
      Stripe.api_key = "sk_test_51OLfQMEDz95u98gmIuHw0Ky4iTAh900Qb9m5AqdLKIQNB7EB0XRWNQv3VNup57XYe9LviXHBIWsp6Ygx4Z0q6tDM00unqe36gf"
    end 
end
