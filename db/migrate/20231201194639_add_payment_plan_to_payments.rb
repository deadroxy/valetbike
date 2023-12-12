class AddPaymentPlanToPayments < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :payment_plan, :string
  end
end
