class BikesController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
    @bike = Bike.find(params[:id])
    @ride = Ride.find(params[:ride_id])
    @ride.update(returned: true)
  end

  def update
    @bike = Bike.find(params[:id])
    if @bike.update(params.require(:bike).permit(:current_station_id))
      redirect_to member_path(current_member.id)
    else
      render('edit')
    end
  end
end
