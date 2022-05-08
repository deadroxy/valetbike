class AddLatitudeToStations < ActiveRecord::Migration[6.1]
  def change
    add_column :stations, :latitude, :integer
  end
end
