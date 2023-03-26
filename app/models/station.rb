class Station < ApplicationRecord
  validates_presence_of    :identifier,
                           :name,
                           :address,
                           :has_kiosk,
                           :num_docks
  validates_uniqueness_of  :identifier
  
  has_many :docked_bikes, class_name: :Bike, foreign_key: :current_station_id
  def getAddress 
    address
  end
  
  def has_bikes
    if docked_bikes >= 1
        true
    else
      false
    end
  end

  def get_num_docks
    num_docks
  end

  def get_num_bikes
    #return number of bikes docked at Station
    docked_bikes.count
  end

  def get_available_docks
    #return number of empty docks at station
    num_docks - docked_bikes.count
  end
end
