class RenamePassword < ActiveRecord::Migration[7.0]
  def change
    rename_column :members, :password, :password_digest
  end
end
