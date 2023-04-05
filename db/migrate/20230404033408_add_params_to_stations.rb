class AddParamsToStations < ActiveRecord::Migration[7.0]
  def change
    add_column :stations, :has_kiosk, :boolean
    add_column :stations, :num_docks, :integer
  end
end
