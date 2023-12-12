class RoutesController < ApplicationController
  def index
  end

  def show
    if logged_in?
      @route = Route.find(params[:id])
    else
      redirect_to login_path, alert: "Please log in!"
    end
  end

  def new
  end

  def edit
  end
end
