class CreateRides < ActiveRecord::Migration[6.1]
  def change
    create_table :rides do |t|
      t.string :name
      t.integer :difficulty
      t.string :length
      t.text :description

      t.timestamps
    end
  end
end
