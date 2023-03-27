class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.integer :identifier
      t.string :purpose
      t.datetime :date
      t.integer :user_id
      t.integer :card_id
      t.integer :amount
      t.integer :rental_id
      
      
      t.timestamps
    end
  end
end
