class AddStationsToRides < ActiveRecord::Migration[6.1]
  def change
    add_column :rides, :startStation, :string
    add_column :rides, :endStation, :string
  end
end
