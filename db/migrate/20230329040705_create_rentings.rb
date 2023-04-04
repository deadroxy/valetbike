class CreateRentings < ActiveRecord::Migration[7.0]
  def change
    create_table :rentings do |t|
      t.integer :bike_id
      t.string :current_station_name
      t.integer :current_station_id
      t.datetime :startTime
      t.datetime :endTime
      t.boolean :status


      t.timestamps
    end


  end
end
