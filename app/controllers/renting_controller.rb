class RentingController < ApplicationController
  def index
    @station = Station.find(params[:station_id])


  end

  def create
    @renting = Renting.new(status: false)

    @station = Station.find(params[:station_id])
    @renting.stations << @station
    @renting[:current_station_id] = params[:station_id]
    @renting[:current_station_name] = @station[:name]
    @renting.save
    @station.rentings << @renting
    @rentCode = @renting.rentCode

    session[:returnCode] = @renting.returnCode
  end

  def show

    @renting = Renting.find(params[:id])
    @renting[:startTime] = Time.now
    
  end


end
