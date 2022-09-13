class RemoveDockedBikesFromStation < ActiveRecord::Migration[7.0]
  def change
    remove_column :stations, :docked_bikes, :integer
  end
end
