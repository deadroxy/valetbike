class AddCurrentStationIdToStation < ActiveRecord::Migration[7.0]
  def change
    add_column :stations, :current_station_id, :integer
  end
end
