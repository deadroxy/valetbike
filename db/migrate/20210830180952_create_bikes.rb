class CreateBikes < ActiveRecord::Migration[6.1]
  def change
    create_table :bikes do |t|
      t.integer :identifier
      t.integer :current_station_identifier

      t.timestamps
    end
  end
end
