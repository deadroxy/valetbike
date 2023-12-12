class CreateRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :routes do |t|
      t.string :name
      t.string :startLocation
      t.string :endLocation
      t.text :instructions
      t.integer :totalTime

      t.timestamps
    end
  end
end
