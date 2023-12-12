class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.date :happened_on
      t.time :start_at

      t.timestamps
    end
  end
end
