class AddDetailsToStations < ActiveRecord::Migration[6.1]
  class station < ActiveRecord::Base
  end
  def change
    change_table :stations do |t|
      add_column :stations, :dock_count, :integer
      add_column :stations, :docked_bike_count, :integer
      station.reset_column_information
      station.all.each do |station|
        station.update_attributes(:dock_count => false, :docked_bike_count => false, :has_kisok => false, :needs_maintenance => false)
      end
    end
  end
end
