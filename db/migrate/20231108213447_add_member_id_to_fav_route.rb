class AddMemberIdToFavRoute < ActiveRecord::Migration[7.0]
  def change
    add_column(:favorite_routes, :member_id, :integer, index:true)
  end
end
