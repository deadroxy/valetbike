class CreateStations < ActiveRecord::Migration[6.1]
  def change
    create_table :stations do |t|
      t.text :address
      t.integer :capacity
      t.string :name
      t.text :description
      t.text :landmarksList

      t.timestamps
    end
  end
end
