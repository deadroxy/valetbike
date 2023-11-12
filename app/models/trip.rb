class Trip < ApplicationRecord
   # belongs_to :bike, class_name: :Bike, foreign_key: :trip_id
    belongs_to :starting_station, class_name: :Station, foreign_key: :start_station_id
    belongs_to :ending_station, class_name: :Station, foreign_key: :end_station_id
    belongs_to :user, class_name: :User, foreign_key: :user_id
end
