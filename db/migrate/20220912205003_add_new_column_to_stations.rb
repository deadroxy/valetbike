class AddNewColumnToStations < ActiveRecord::Migration[7.0]
  def change
    add_column :stations, :docked_bikes, :integer
    add_column :stations, :dock_count, :integer
  end
end
