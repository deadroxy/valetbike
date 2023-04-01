class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :cardholder_name
      t.integer :card_number
      t.datetime :expiration_date
      t.integer :cvv
      t.decimal :card_balance

      t.timestamps
    end
  end
end
