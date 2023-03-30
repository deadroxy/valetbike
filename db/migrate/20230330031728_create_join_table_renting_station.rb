class CreateJoinTableRentingStation < ActiveRecord::Migration[7.0]
  def change
    create_join_table :rentings, :stations do |t|
      # t.index [:renting_id, :station_id]
      # t.index [:station_id, :renting_id]
    end
  end
end
