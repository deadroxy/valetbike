class AddEndtimeToTrips < ActiveRecord::Migration[7.0]
  def change
    add_column :trips, :end_at, :datetime
  end
end
