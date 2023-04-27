class RentingController < ApplicationController
  
  def index
    @station = Station.find(params[:station_id])
  end

  def create
    @current_renting = current_user.renting.incompleted.first
    
    if @current_renting.present?
      flash[:notice] = "Please end your previous rental process before starting a new one."
      redirect_to action: 'show', id: @current_renting[:id]
    end


    @station = Station.find(params[:station_id])
    @bike = @station.docked_bikes.first
    @station.docked_bikes.first.delete

    # start create new renting
    @renting = Renting.new(
      status: false, 
      start_station_id: params[:station_id], 
      user_id: current_user[:id])
    @renting.stations << @station
    @rentCode = @renting.rentCode


    # record the time
    @renting[:startTime] = Time.zone.now
    @renting[:endTime] = @renting[:startTime] + 2.hour

    @renting.save

  end

  def show
    @renting = Renting.find(params[:id])
    @startStation = Station.find(@renting[:start_station_id])
  end

  def return
    @renting = Renting.find(params[:renting_id])
    @endStation = Station.find(params[:station_id])
    @renting 
    @renting[:end_station_id] = params[:station_id]
    @startStation = Station.find(@renting[:start_station_id])
    
    @renting.save
  end

  def submit_code

    @renting = Renting.find(params[:id])
    @endStation = Station.find(@renting[:end_station_id])
    @startStation = Station.find(@renting[:start_station_id])

    @renting.stations << @endStation
    @returnCode = params[:submit_code]

    session[:returnCode] = 1234.to_s
    if @returnCode
      if @returnCode == session[:returnCode]
          @renting.status = true
          redirect_to action: 'completed', id: @renting[:id]
          @renting.save
      else
          render ("return") 
          flash[:notice] = "Please enter the correct rental code."
      end  
    end 
  end

  def completed
    @renting = Renting.find(params[:id])
    @endStation = Station.find(@renting[:end_station_id])
  end


end