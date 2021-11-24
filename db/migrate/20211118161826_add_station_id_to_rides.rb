class AddStationIdToRides < ActiveRecord::Migration[6.1]
  def change
    add_column :rides, :startStationId, :string
    add_column :rides, :endStationId, :string
  end
end
