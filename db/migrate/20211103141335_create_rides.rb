class CreateRides < ActiveRecord::Migration[6.1]
  def change
    create_table :rides do |t|
      t.string :difficult
      t.integer :length
      t.text :description

      t.timestamps
    end
  end
end
