class RentController < ApplicationController
  def index
    @stations = Station.all
  end

  def update
    @station = Station.find_by(identifier: params[:stationId])
    @bike = @station.docked_bikes.first()
    if has_membership?
      @bike.update_attribute(:current_station, nil)
      @bike.update_attribute(:current_user, current_user)
      redirect_to({:controller => 'stations', :action => 'index' })
    else
      flash[:notice] = "Please complete payment below:"
      redirect_to({:controller => 'payments', :action => 'index' })
    end
    # respond_to do |format|
    #   if @bike.update_attribute(:current_station, nil)
    #     flash[:notice] = "Please complete payment below:"
    #     format.html { redirect_to({:controller => 'payments', :action => 'index' })}
    #   else
    #     flash[:notice] = "Purchase was unsuccessful. Please try another station."
    #     format.html { redirect_to({:controller => 'rent', :action => 'index' })}
    #   end
    # end


  end

end
