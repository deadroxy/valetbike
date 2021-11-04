class CreateUser < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
     t.integer :identifier
     t.string :Email
     t.string :Password
     t.string :Username
     t.decimal :CreditCardNum, :precision =>16
     t.string :ExpDate
     t.integer :SecurityCode

      
                         
               

      t.timestamps
    end
  end
end
