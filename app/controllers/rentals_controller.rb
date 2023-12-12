
class RentalsController < ApplicationController
  def rent
    if current_user.active_bike != nil
      flash[:notice] = "Please return the current bike before renting"
      redirect_to action: "show", id: current_user.active_bike
    elsif !current_user.subscribed?
      flash[:notice] = "Please subscribe before renting"
      redirect_to pricing_path

      
    else 
    @bike = Bike.find(params[:id])
    
    @rental = Rental.new(bike_id: @bike.id,
      user_id: current_user[:id],
      start_time: Time.zone.now
      )
    
    current_user.active_bike = @bike.identifier
    current_user.save

    @rental.save

    @bike.avail = false
    @bike.current_station_id = nil
    @bike.save
    range = [*'0'..'9',*'A'..'Z',*'a'..'z']
    @code = Array.new(5){ range.sample }.join
    end
    
  end

  def show
    @bike = Bike.find_by(identifier: current_user.active_bike)
    @rental = Rental.find_by(end_time: nil)
  end

  
  def index 
    @past_rentals = Rental.where("end_time < :current_time", { current_time: Time.zone.now })
  end

end

