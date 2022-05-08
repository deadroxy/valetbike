class ChangeLongToFloatInStations < ActiveRecord::Migration[6.1]
  def change
    change_column :stations, :longitude, :float
  end
end
