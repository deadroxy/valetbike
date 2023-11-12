class AddCapacityToStations < ActiveRecord::Migration[7.0]
  def change
    add_column(:stations, :capacity, :integer, index: true)
  end
end
