class SetDefaultWalletPoint < ActiveRecord::Migration[7.0]
  def change
    change_column(:users, :wallet_point, :integer, default: 0)
  end
end
