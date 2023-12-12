class AddBikeIdToRides < ActiveRecord::Migration[7.0]
  def change
    add_column(:rides, :bike_id, :integer, index:true)
  end
end
