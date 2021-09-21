class AddCountToStation < ActiveRecord::Migration[6.1]
  def change
    add_column :stations, :dock_count, :integer
  end
end
