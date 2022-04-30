
class RideController < ApplicationController
    def ride
      @ride = Ride.find(params[:id])
    end

    def start
      # make sure user is logged in
      redirect_to root_path, notice: "Please sign in or create an account to rent a bike" if !Current.user
      # make sure user has a payment plans

      if  Current.user.payment=="" or !Current.user.payment
        redirect_to plans_path, notice: "Please selct a payment plan before starting a ride"
        return 
      end

      @bike = Bike.find_by(current_station_id: params[:station_id])
      # make sure there is a bike docked at the station
      redirect_to "/map", notice: "No available bikes. Please choose a different station" if !@bike

      if @bike.update(current_station_id: nil)
        @ride = Ride.new(user: Current.user, bike: @bike, start_time: Time.now, start_station_id: params[:station_id])
        if @ride.save
          redirect_to "/ride/#{@ride.id}"
        else
          @bike.update(current_station_id: params[:station_id]) # re-dock the bike at the station if ride fails to save
          redirect_to root_path, notice: "Sorry, something went wrong :("
        end
      else
        redirect_to root_path, notice: "Sorry, something went wrong :("
      end
    end

    def end
      @ride = Ride.find(params[:id])
      # if time, add option to dock bike at different station from start
      @station = Station.find(@ride.start_station_id)
      if @station.dock_count > @station.docked_bikes.count && @ride.bike.update(current_station_id: @station.id)
        # update ride
        @ride.update(end_time: Time.now, end_station_id: @station.id)
        redirect_to root_path, notice: "Thank you for travelling with ValetBike!"
      else
        @ride.update(end_time: Time.now) # remove this line if adding the option to dock bike at different station
        redirect_to "/ride/#{@ride.id}", notice: "Please return your bike to a station with empty docks!"
      end
    end



  end
