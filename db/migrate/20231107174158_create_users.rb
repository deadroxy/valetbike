class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.date :dob
      t.text :email

      t.timestamps
    end
  end
end
#id is build in
#membership_id to be done later
#payment method: need to figure out structure