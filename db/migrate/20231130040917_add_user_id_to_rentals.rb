class AddUserIdToRentals < ActiveRecord::Migration[7.0]
  def change
    add_column :rentals, :user_id, :integer
  end
end
