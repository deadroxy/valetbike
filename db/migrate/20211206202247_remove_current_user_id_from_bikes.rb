class RemoveCurrentUserIdFromBikes < ActiveRecord::Migration[6.1]
  def change
    remove_column :bikes, :current_user_id, :bigint
  end
end
