class CreateBillings < ActiveRecord::Migration[6.1]
  def change
    create_table :billings do |t|
      t.string :payment_method, null: false
      t.string :holder_name, null: false
      t.string :card_number, null: false
      t.string :expir_date, null: false
      t.string :cvv, null: false
      

      t.timestamps
    end
  end
end
