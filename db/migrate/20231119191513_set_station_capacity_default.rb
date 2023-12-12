class SetStationCapacityDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:stations, :capacity, 10)
  end
end
