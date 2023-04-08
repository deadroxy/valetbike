class AddStationNameToService < ActiveRecord::Migration[7.0]
  def change
    add_column :services, :bike_station, :string
  end
end
