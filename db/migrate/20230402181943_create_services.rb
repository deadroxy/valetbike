class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.string :name
      t.string :email
      t.string :bike_number
      t.string :bike_station
      t.string :additional_information
      

      t.timestamps
    end
  end
end
