# app/controllers/users/omniauth_callbacks_controller.rb
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    action_type = session.delete(:action_type)
    if action_type == 'login'
      handle_login_auth('Google')
    else
      handle_signup_auth('Google')
    end
  end
  
  def facebook
    action_type = session.delete(:action_type)
    if action_type == 'login'
      handle_login_auth('Facebook')
    else
      handle_signup_auth('Facebook')
    end
  end
  

  private

  def handle_signup_auth(kind)
    auth = request.env['omniauth.auth']
    #@user = User.find_from_omniauth(auth)
    @user = User.find_by(email: auth.info.email) || User.from_omniauth(auth)

    if @user && @user.persisted?
      set_flash_message(:alert, :failure, kind: kind, reason: "Email already exists. Please login.")
      redirect_to new_user_session_url
    else
      # Create a new user
      @user = User.from_omniauth(auth)
      if @user.save(validate: false)
        sign_in_and_redirect @user, event: :authentication
        set_flash_message(:notice, :success, kind: kind) if is_navigational_format?
      else
        set_flash_message(:alert, :failure, kind: kind, reason: "Something went wrong. Please try again.")
        redirect_to new_user_registration_url
      end
    end
  end

  def handle_login_auth(kind)
    auth = request.env['omniauth.auth']
    @user = User.find_by(email: auth.info.email) || User.from_omniauth(auth)

    if @user && @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: kind) if is_navigational_format?
    else
      set_flash_message(:alert, :failure, kind: kind, reason: "Email does not exist. Please signup.")
      redirect_to new_user_registration_url
    end
  end
end