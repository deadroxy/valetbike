class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.string :username
      t.string :password
      t.string :email

      t.timestamps
    end
  end
end
