class AddPaymentDetailsToMembershipAssignment < ActiveRecord::Migration[7.0]
  def change
    add_column :membership_assignments, :is_paid, :boolean, :default => false
  end
end
