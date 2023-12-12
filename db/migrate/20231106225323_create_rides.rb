class CreateRides < ActiveRecord::Migration[7.0]
  def change
    create_table :rides do |t|
      t.integer :length
      t.datetime :timeStart
      t.string :timeEnd
      t.string :datetime
      t.integer :rideCost

      t.timestamps
    end
  end
end
