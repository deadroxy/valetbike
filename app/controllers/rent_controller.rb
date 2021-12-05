class RentController < ApplicationController
  def index
    @stations = Station.all
  end

  def update
    @station = Station.find_by(identifier: params[:stationId])
    @bike = @station.docked_bikes.first()
    respond_to do |format|
      if @bike.update_attribute(:current_station, nil)
        flash[:notice] = "Please complete payment below:"
        format.html { redirect_to({:controller => 'payment', :action => 'index' })}
      else
        flash[:notice] = "Purchase was unsuccessful. Please try another station."
        format.html { redirect_to({:controller => 'rent', :action => 'index' })}
      end
    end


  end

end
