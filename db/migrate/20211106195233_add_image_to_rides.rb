class AddImageToRides < ActiveRecord::Migration[6.1]
  def change
    add_column :rides, :image, :string
  end
end
