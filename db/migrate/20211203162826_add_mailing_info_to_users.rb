class AddMailingInfoToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :streetAddress, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :phoneNumber, :string
  end
end
