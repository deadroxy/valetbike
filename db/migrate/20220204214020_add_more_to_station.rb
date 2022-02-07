class AddMoreToStations < ActiveRecord::Migration[6.1]
  class station < ActiveRecord::Base
  end
  def change
    add_column :stations, :has_kiosks, :integer
    add_column :stations, :needs_maintenance, :integer
    station.reset_column_information
    station.all.each do |station|
      station.update_attributes(:dock_count => false, :docked_bike_count => false, :has_kisok => false, :needs_maintenance => false)
    end
  end
end
