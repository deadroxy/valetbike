class BikesController < ApplicationController
  def index
  end

  def show
    @bikes = Bike.order('id ASC')
    @stations = Station.order('id ASC')
    
    
  end
  
  def unlock
   @bikes = Bike.order('id ASC')
  end
  
  def unlockConfirm
   @bikes = Bike.order('id ASC')
  end
  
  def return
   @bikes = Bike.order('id ASC')
  end
  
  def returnConfirm
    @bikes = Bike.order('id ASC')
  
  end
end
