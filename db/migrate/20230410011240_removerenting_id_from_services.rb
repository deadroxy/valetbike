class RemoverentingIdFromServices < ActiveRecord::Migration[7.0]
  def change
    remove_column :services, :renting_id
  end
end
