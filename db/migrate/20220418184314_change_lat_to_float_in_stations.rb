class ChangeLatToFloatInStations < ActiveRecord::Migration[6.1]
  def change
    change_column :stations, :latitude, :float
  end
end
