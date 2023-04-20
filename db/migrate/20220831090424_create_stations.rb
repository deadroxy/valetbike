class CreateStations < ActiveRecord::Migration[7.0]
  def change
    create_table :stations do |t|
      t.integer :identifier
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.string :country
      t.string :address
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6

      t.timestamps
    end
  end
end
