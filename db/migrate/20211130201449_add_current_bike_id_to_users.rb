class AddCurrentBikeIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :current_bike_id, :integer
  end
end
