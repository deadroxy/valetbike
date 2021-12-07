class ReturnsController < ApplicationController
  def index
    @stations = Station.all
  end

  def update
    @station = Station.find_by(identifier: params[:stationId])
    if bike_rented?
      @bike = current_user.rented_bikes.first()
      @bike.update_attribute(:current_station, @station)
      @bike.update_attribute(:current_user, nil)
      flash[:notice] = "You've successfully return the bike!"
    else
      flash[:notice] = "Please make sure you have a bike rented before returning!"
    end

    # @station.docked_bikes.append(@bike)
    # respond_to do |format|
    #   if @bike.update_attribute(:current_station, nil)
    #     flash[:notice] = "Please confirm return below:"
    #     format.html { redirect_to({:controller => 'return', :action => 'index' })}
    #   else
    #     flash[:notice] = "Return was unsuccessful. Please try another station."
    #     format.html { redirect_to({:controller => 'return', :action => 'index' })}
    #   end
    # end
  end

  def bike_rented?
    if (logged_in?)
      current_user.rented_bikes.any?
    else
      return false
    end
  end
end
  