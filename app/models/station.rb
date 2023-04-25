class Station < ApplicationRecord
  validates_presence_of    :identifier,
                           :name,
                           :address,
                           :num_docks
  validates_uniqueness_of  :identifier
  
  validates_inclusion_of :has_kiosk, :in => [true, false]
  has_many :docked_bikes, class_name: :Bike, foreign_key: :current_station_id
  def getAddress 
    address
  end
  
  def has_bikes
    if docked_bikes >= 1
        return true
    end
    false
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

  def available_docks
    Station.docked_bikes
    # use map to get docks_ids
    # hash set exclusion 
  end
end
