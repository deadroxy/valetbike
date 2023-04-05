class AddUserAttributes < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :email, :string
    add_column :users, :address, :string
    add_column :users, :phone_number, :string
    add_column :users, :date_birth, :date
    add_column :users, :credit, :decimal
  end
end
