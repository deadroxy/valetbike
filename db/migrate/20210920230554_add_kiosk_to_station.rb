class AddKioskToStation < ActiveRecord::Migration[6.1]
  def change
    add_column :stations, :has_kiosk, :integer
  end
end
