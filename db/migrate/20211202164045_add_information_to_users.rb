class AddInformationToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :firstName, :string
    add_column :users, :lastName, :string
    add_column :users, :membership, :string
  end
end
