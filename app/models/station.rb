class Station < ApplicationRecord
    has_many :docked_bikes, class_name: :Bike, foreign_key: :current_station_id
end
