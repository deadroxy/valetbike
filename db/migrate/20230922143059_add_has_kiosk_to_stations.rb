class AddHasKioskToStations < ActiveRecord::Migration[7.0]
  def change
    add_column :stations, :has_kiosk, :integer, default: 0
  end
end
