class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.integer :identifier
      t.string :purpose
      t.integer :user_id
      t.integer :card_id
      t.integer :amount
      t.integer :rental_id
      t.integer :membership_id
      t.datetime :date
      
      t.timestamps
    end
  end
end
