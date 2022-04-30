class Ride < ApplicationRecord
  belongs_to :user, class_name: :Users
  belongs_to :bike, class_name: :Bike

  validates :user, :bike, :start_time, :start_station_id, presence: true
end
