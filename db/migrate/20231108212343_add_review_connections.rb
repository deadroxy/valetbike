class AddReviewConnections < ActiveRecord::Migration[7.0]
  def change
    add_column(:reviews, :member_id, :integer, index:true)
    add_column(:reviews, :route_id, :integer, index:true)
  end
end
