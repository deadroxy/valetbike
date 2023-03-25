class Station < ApplicationRecord
  validates_presence_of    :station_id,
                           :station_name,
                           :address,
                           :has kiosk,
                           :num_docks
  validates_uniqueness_of  :station_id
  
  has_many :docked_bikes, class_name: :Bike, foreign_key: :current_station_id
  def getAddress 
    @address
  end
  
  def has_bikes
    if @bikes >= 1
        true
    end
  end

  def get_num_docks
    @num_docks
  end

  def get_num_bikes
    #return number of bikes docked at Station
    @bikes.count
  end

  def get_available_docks
    #return number of empty docks at station
    @num_docks - @bikes.count
  end
end
