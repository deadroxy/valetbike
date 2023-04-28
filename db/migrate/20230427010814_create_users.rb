class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.string :phone_num
      t.string :address
      t.date :birthday
      t.boolean :admin
      t.boolean :block
      t.integer :wallet_point
      t.string :default_payment

      t.timestamps
    end
  end
end
