class AddLongitudeToStations < ActiveRecord::Migration[6.1]
  def change
    add_column :stations, :longitude, :integer
  end
end
