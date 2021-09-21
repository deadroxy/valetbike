class Station < ApplicationRecord
  validates_presence_of    :identifier,
                           :name,
                           #:docked_bike_count,
                           :address
  validates_uniqueness_of  :identifier
  
  has_many :docked_bikes, class_name: :Bike, foreign_key: :current_station_id
  
end
