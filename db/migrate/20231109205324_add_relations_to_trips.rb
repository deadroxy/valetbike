class AddRelationsToTrips < ActiveRecord::Migration[7.0]
  def change
    add_column(:trips, :bike_id, :integer)
    add_column(:trips, :user_id, :integer, index: true)
    add_column(:trips, :starting_station_id, :integer, index: true)
    add_column(:trips, :ending_station_id, :integer, index: true)
  end
end
