class AddCountToStations < ActiveRecord::Migration[7.0]
  def change
    add_column :stations, :count, :integer
  end
end
