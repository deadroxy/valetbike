class CreateFavoriteStations < ActiveRecord::Migration[7.0]
  def change
    create_table :favorite_stations do |t|

      t.timestamps
    end
  end
end
