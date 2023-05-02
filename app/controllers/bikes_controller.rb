class BikesController < ApplicationController

def new
     @bike = Bike.new
end
      
def create
     #@station = Station.find_by_identifier(sta_params)
     #@station.save
     #@bike = @station.docked_bikes.create(bike_params)    
     @bike = Bike.new(bike_params)
     if @bike.save!
          flash[:success]= "Bike added."
          redirect_to stations_path
     else
          render 'new'
     end
end

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
 
  def bike_params
     params.require(:bike).permit(:identifier, :current_station_id)
  end



end