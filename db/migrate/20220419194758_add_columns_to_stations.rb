class AddColumnsToStations < ActiveRecord::Migration[6.1]
  def change
    add_column :stations, :has_kiosk, :int
    add_column :stations, :needs_maintenance, :int
    add_column :stations, :dock_count, :int
    add_column :stations, :docked_bike_count, :int
  end
end
