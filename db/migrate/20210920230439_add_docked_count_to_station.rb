class AddDockedCountToStation < ActiveRecord::Migration[6.1]
  def change
    add_column :stations, :docked_bike_count, :integer
  end
end
