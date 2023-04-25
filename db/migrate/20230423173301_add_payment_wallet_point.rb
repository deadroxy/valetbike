class AddPaymentWalletPoint < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :wallet_point, :integer
    add_column :users, :default_payment, :string
  end
end
