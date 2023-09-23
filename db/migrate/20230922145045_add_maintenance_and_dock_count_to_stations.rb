class AddMaintenanceAndDockCountToStations < ActiveRecord::Migration[7.0]
  def change
    add_column :stations, :needs_maintenance, :integer
    add_column :stations, :dock_count, :integer
    change_column_default(:stations, :has_kiosk, nil)
  end
end
