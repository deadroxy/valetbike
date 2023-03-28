class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :membership_id
      t.string :email_address
      t.string :phone_number
      t.integer :user_id
      t.boolean :is_admin

      t.timestamps
    end
  end
end
