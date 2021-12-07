module ApplicationHelper
  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @current_user ||= User.find_by(session[:user_id]) if !!session[:user_id]
  end 

  def has_membership?
    if (logged_in?)
      !current_user.membership.nil?
    else
      return false
    end
  end

  def bike_rented?
    if (logged_in?)
      current_user.rented_bikes.any?
    else
      return false
    end
  end
end
