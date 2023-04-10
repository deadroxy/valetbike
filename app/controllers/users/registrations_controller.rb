class Users::RegistrationsController < Devise::RegistrationsController
  def new
    super
  end
  protected

  def after_sign_up_path_for(resource)
    super(resource) || locations_path
  end

  def signup
    # ...
  end
end
