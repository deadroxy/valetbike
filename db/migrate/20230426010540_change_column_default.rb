class ChangeColumnDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :admin, false
    change_column_default :users, :block, false
    change_column(:users, :wallet_point, :integer, default: 0)
  end
end
