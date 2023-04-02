class CreateJoinTableRentingBike < ActiveRecord::Migration[7.0]
  def change
    create_join_table :rentings, :bikes do |t|
      t.index [:renting_id, :bike_id]
      t.index [:bike_id, :renting_id]
    end
  end
end
