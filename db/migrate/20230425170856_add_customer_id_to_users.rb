class AddCustomerIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :customer_id, :bigint
  end
end
