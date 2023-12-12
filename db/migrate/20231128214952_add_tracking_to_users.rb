class AddTrackingToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :active_bike, :integer
    add_column :users, :total_minutes, :integer
  end
end
