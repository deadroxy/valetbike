class ConnectPayment < ActiveRecord::Migration[7.0]
  def change
    add_column(:payments, :member_id, :integer, index:true)
    add_column(:payments, :ride_id, :integer, index:true)
  end
end
