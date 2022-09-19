class AddDockedBikesToStation < ActiveRecord::Migration[7.0]
  def change
    add_column :stations, :docked_bikes, :integer
  end
end
