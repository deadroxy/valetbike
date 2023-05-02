class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :cardholder_name
      t.integer :user_id
      t.decimal :card_number
      t.date :expiration_date
      t.integer :cvv
      t.float :card_balance

      t.timestamps
    end
  end
end
