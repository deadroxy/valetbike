class CreateStations < ActiveRecord::Migration[6.1]
  def change
    create_table :stations do |t|
      t.integer :identifier
      t.string :name
      #t.integer :docked_bike_count
      t.string :address
      t.timestamps
    end
  end
end
