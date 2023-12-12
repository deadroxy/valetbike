class ActiveTripController < ApplicationController
  def index
  end

  def base_map
      @stations = Station.all.order(identifier: :asc)
      @num_bikes = Bike.all.count
      @num_stations = Station.all.count
  end

  def rent_map
    @stations = Station.all.order(identifier: :asc)
  end

  def return_map
      @stations = Station.all.order(identifier: :asc)
  end
    
  def return

  end

  def testing
      @stations = Station.all.order(identifier: :asc)
  end
end
