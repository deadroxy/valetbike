class CreateStationLocs < ActiveRecord::Migration[7.0]
  def change
    drop_table :station_locs
    create_table :station_locs do |t|
      t.string :name
      t.string :address
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
    add_index :station_locs, :longitude
    add_index :station_locs, :latitude
  end
end
