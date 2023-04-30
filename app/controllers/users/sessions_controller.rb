class Users::SessionsController < Devise::SessionsController
  def new
    render 'sessions/new'
  end
  

  def google_signin
    session[:action_type] = params[:action_type]
    redirect_to user_google_oauth2_omniauth_authorize_path
  end
  
  def facebook_signin
    session[:action_type] = params[:action_type]
    redirect_to user_facebook_omniauth_authorize_path
  end
  
   
  

  
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
