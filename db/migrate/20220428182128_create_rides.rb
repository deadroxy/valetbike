class CreateRides < ActiveRecord::Migration[6.1]
  def change
    create_table :rides do |t|
      t.references :user, null: false, foreign_key: true
      t.references :bike, null: false, foreign_key: true
      t.datetime :start_time
      t.integer :start_station_id
      t.datetime :end_time
      t.integer :end_station_id

      t.timestamps
    end
  end
end
