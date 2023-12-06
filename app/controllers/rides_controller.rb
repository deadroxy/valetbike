class RidesController < ApplicationController
  def index
    @rides = Ride.all.order(id: :asc)
  end

  def show
    @ride = Ride.find(params[:id])
  end

  def new
    @ride = Ride.new(bike_id: params[:bike_id], member_id: current_member.id)
  end

  def create
    @ride = Ride.new(params.require(:ride).permit(:member_id, :bike_id, :length))
    if @ride.save
      @ride.bike.current_station_id = nil
      @ride.bike.save
      redirect_to rides_path
    else
      redirect_to new_ride_path
    end
  end

  def edit
  end
end