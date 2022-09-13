class AddBikeCountColumnToStation < ActiveRecord::Migration[7.0]
  def change
    add_column :stations, :docked_bikes_count, :integer
  end
end
