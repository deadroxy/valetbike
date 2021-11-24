class Station < ApplicationRecord
  validates_presence_of :name,
                        :address,
                        :topLocation,
                        :leftLocation
  has_many :docked_bikes, class_name: :Bike, foreign_key: :current_station_id
end
