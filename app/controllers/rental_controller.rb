class RentalController < ApplicationController
  def show
    @rental = Rental.find(params[:id])
    @bike = @rental.bike
    @renter = @rental.renter
  end

  def new
  end

  def return
  end

  def index
  end

  def confirm
  end

  def station_params
    #params.require(:rental).permit(:name, :address, :identifier)
  end

end
