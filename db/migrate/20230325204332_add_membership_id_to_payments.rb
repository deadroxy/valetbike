class AddMembershipIdToPayments < ActiveRecord::Migration[7.0]
  def change
    add_column(:payments, :membership_id, :integer, index: true)
  end
end
