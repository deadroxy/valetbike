class RentingController < ApplicationController
  def index
    @station = Station.find(params[:station_id])
  end

  def create

    # renting 
    @renting = Renting.new(status: false)

    @station = Station.find(params[:station_id])
    @renting.stations << @station
    @renting[:current_station_id] = params[:station_id]
    @renting[:current_station_name] = @station[:name]
    @station.rentings << @renting
    @rentCode = @renting.rentCode

    session[:returnCode] = @renting.returnCode
    @renting[:startTime] = Time.now
    @renting[:endTime] = @renting[:startTime] + 2.hour
    @renting.save
  end

  def show
    @renting = Renting.find(params[:renting_id])
    @station = Station.find(@renting[:current_station_id])
    puts "startTime = #{@renting[:startTime]}"
  end

  def availableStations
    @stations = Station.all.order(identifier: :asc)
    puts @stations
    @renting = Renting.find(params[:renting_id])
    #render("availableStations") 
  end

  def return
    @renting = Renting.find(params[:renting_id])
    @station = Station.find(params[:station_id])
    render ("return")
  end

  def submit_code
    @renting = Renting.find(params[:renting_id])
    @station = Station.find(params[:station_id])
    @returnCode = params[:submit_code]
    if @returnCode
      if @returnCode == @renting.rentCode
          redirect_to submit_path
      else
          render ("return") 
          flash[:notice] = "Please enter the correct rental code."
      end  
    end 
  end

end