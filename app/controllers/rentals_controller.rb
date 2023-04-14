class RentalsController < ApplicationController
  def show
    @rental = Rental.find(params[:id])
    @bike = @rental.bike
    @renter = @rental.renter
  end

  def new
    @bike = Bike.find(params[:id])
    @rental = Rental.new(bike_id: @bike.id, renter_id: current_user.id)
  end

  def create
    #@bike = Bike.find(params[:rental])
    @rental = Rental.new(rental_params)
    #@rental.user_id = current_user.id
    if @rental.save
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
    params.
      require(:rental).
      permit(bike_id: params[:bike_id], user_id: params[:user_id])
  end

end
