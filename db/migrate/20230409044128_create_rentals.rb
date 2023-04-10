class CreateRentals < ActiveRecord::Migration[7.0]
  def change
    create_table :rental do |t|
      t.integer :hours
      t.float :price

      t.timestamps
    end
  end
end
