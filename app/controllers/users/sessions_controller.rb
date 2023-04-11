class Users::SessionsController < Devise::SessionsController
  def destroy
    super do
      flash[:notice] = "You have logged out successfully"
      redirect_to root_path and return
    end
  end

  protected

  def after_sign_in_path_for(resource)
    super(resource) || locations_path
  end

  def login
    # ...
  end
end
