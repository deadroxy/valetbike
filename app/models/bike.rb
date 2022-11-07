class Bike < ApplicationRecord
    validates_presence_of :identifier, :current_station_id
end
