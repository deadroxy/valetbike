class AddMapLocationToStation < ActiveRecord::Migration[6.1]
  def change
    add_column :stations, :topLocation, :float
    add_column :stations, :leftLocation, :float
  end
end
