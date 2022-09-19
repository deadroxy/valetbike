class StationsController < ApplicationController
  
  def index
    @stations = Station.all.order(identifier: :asc)
    @bikes = Bike.all.order(identifier: :asc)
    
    for s in @stations do
      for b in @bikes do
        if (b.current_station_id == s.identifier) then
          s.docked_bikes.push(b)
          s.save
        end
      end
    end
  end

  
end
