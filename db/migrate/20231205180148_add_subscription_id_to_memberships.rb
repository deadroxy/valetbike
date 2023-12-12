class AddSubscriptionIdToMemberships < ActiveRecord::Migration[7.0]
  def change
    add_column :memberships, :subscription_id, :string
  end
end
