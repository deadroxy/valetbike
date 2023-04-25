class AddPositionBackToMemberships < ActiveRecord::Migration[7.0]
  def change
    add_column :memberships, :position, :integer
  end
end
