class AddUserIdToPayments < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :user_id, :integer
  end
end
