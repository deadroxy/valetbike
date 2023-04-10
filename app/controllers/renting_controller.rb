class RentingController < ApplicationController
  def index
    @station = Station.find(params[:station_id])
  end

  def create

    @station = Station.find(params[:station_id])
    # start create new renting
    @renting = Renting.new(status: false, current_station_id: params[:station_id], current_station_name: @station[:name])

    @renting.stations << @station
    @rentCode = @renting.rentCode

    session[:returnCode] = @renting.returnCode
    @renting[:startTime] = Time.zone.now
    @renting[:endTime] = @renting[:startTime] + 2.hour

    @renting.save

  end

  def show
    @renting = Renting.find(params[:renting_id])
    @station = Station.find(@renting[:current_station_id])
  end

end
