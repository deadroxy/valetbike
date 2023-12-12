class AddBikeIdToRentals < ActiveRecord::Migration[7.0]
  def change
    add_column :rentals, :bike_id, :integer
  end
end
