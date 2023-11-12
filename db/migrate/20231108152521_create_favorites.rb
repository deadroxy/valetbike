class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.integer :num_of_trip

      t.timestamps
    end
  end
end
