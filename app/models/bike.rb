class Bike < ApplicationRecord
    belongs_to :current_station, class_name: :Station, foreign_key: :current_station_id, optional: true
    has_many :rides, class_name: :Ride
end
