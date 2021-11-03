class CreateBikes < ActiveRecord::Migration[6.1]
  def change
    create_table :bikes do |t|
      t.time :checkoutTime
      t.time :checkinTime
      t.integer :current_station_id
      t.integer :current_user_id

      t.timestamps
    end
  end
end
