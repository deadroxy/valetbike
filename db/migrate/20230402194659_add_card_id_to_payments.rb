class AddCardIdToPayments < ActiveRecord::Migration[7.0]
  def change
    add_column(:payments, :card_id, :integer, index: true)
  end
end
