class BikesController < ApplicationController

  def index
       if params[:reverse].blank? || params[:reverse]=="0"
            @bikes = Bike.all.order(identifier: :asc)
       else
            @bikes = Bike.all.order(identifier: :desc)
       end
  end

  def unlock
     if session[:user_id]
          @user = User.find(session[:user_id])
      end
  end

end