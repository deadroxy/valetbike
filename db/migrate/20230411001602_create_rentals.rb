class CreateRentals < ActiveRecord::Migration[7.0]
  def change
    create_table :rentals do |t|
      t.references :bike, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :start_station_id
      t.integer :end_station_id
      t.datetime :start_time
      t.datetime :end_time
      t.integer :price
      t.index [:bike_id, :user_id]
      t.index [:user_id, :bike_id]
      
      t.timestamps
    end
  end
end
