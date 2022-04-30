class CreateStations < ActiveRecord::Migration[6.1]
  def change
    create_table :stations do |t|
      t.integer :identifier
      t.string :name
      t.string :address
      t.integer :dock_count
      t.decimal :latitude, precision: 16, scale: 14
      t.decimal :longitude, precision: 16, scale: 14

      t.timestamps
    end
  end
end
