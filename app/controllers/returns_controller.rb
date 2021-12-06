class ReturnsController < ApplicationController
  def index
    @stations = Station.all
  end
  def update
    @station = Station.find_by(identifier: params[:stationId])
    @bike = Bike.find_by(identifier: params[:bikeId])
    @bike.current_station_id = @station
    @station.docked_bikes.append(@bike)
    respond_to do |format|
      if @bike.update_attribute(:current_station, nil)
        flash[:notice] = "Please confirm return below:"
        format.html { redirect_to({:controller => 'return', :action => 'index' })}
      else
        flash[:notice] = "Return was unsuccessful. Please try another station."
        format.html { redirect_to({:controller => 'return', :action => 'index' })}
      end
    end
  end
end
  