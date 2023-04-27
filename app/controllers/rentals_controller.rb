class RentalsController < ApplicationController
  def show
    @rental = Rental.find(params[:id])
    @bike = @rental.bike
    @renter = @rental.renter
  end

  def new
    @bike = Bike.find(params[:id])
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)
    if @rental.save
      bike = Bike.find(@rental.bike_id)
      #bike.current_station_id=nil
      bike.update(current_station: nil)
      bike.update(current_station_id: nil)
      bike.update(dock_id: nil)
      bike.save
      redirect_to(pages_success_path)
    else
      @rental.get_bike
      render('new')
    end
  end
  
  def return
  end

  def index
  end

  def confirm
  end

  private 

  def rental_params 
    params.require(:rental).permit(:bike_id, :renter_id)
  end

end
