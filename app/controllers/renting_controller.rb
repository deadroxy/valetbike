class RentingController < ApplicationController
  def index
    @station = Station.find(params[:station_id])
  end

  def create

    @station = Station.find(params[:station_id])
    # start create new renting
    @renting = Renting.new(status: false, start_station_id: params[:station_id])

    @renting.stations << @station
    @rentCode = @renting.rentCode

    session[:returnCode] = 1234.to_s
    @renting[:startTime] = Time.zone.now
    @renting[:endTime] = @renting[:startTime] + 2.hour

    @renting.save

  end

  def show
    @renting = Renting.find(params[:renting_id])
    @station = Station.find(@renting[:start_station_id])
  end

  def availableStations
    @stations = Station.all.order(identifier: :asc)
    puts @stations
    @renting = Renting.find(params[:renting_id])
    #render("availableStations") 
  end

  def return
    @renting = Renting.find(params[:renting_id])
    @endStation = Station.find(params[:station_id])
    @renting[:end_station_id] = params[:station_id]
    @startStation = Station.find(@renting[:start_station_id])

    @renting.save
  end

  def submit_code

    @renting = Renting.find(params[:id])
    @endStation = Station.find(@renting[:end_station_id])
    @startStation = Station.find(@renting[:start_station_id])

    @returnCode = params[:submit_code]

    session[:returnCode] = 1234.to_s
    puts session[:returnCode] == @returnCode
    puts session[:returnCode].class
    if @returnCode
      if @returnCode == session[:returnCode]
          @renting.status = true
          redirect_to completed_path(@renting)
      else
          render ("return") 
          flash[:notice] = "Please enter the correct rental code."
      end  
    end 
  end

  def completed
    @renting = Renting.find(params[:renting_id])
    @endStation = Station.find(@renting[:end_station_id])
  end


end