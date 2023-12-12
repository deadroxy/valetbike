class ConnectFavRoutesAndStations < ActiveRecord::Migration[7.0]
  def change
    add_column(:favorite_routes, :route_id, :integer, index:true)
    add_column(:favorite_stations, :member_id, :integer, index:true)
    add_column(:favorite_stations, :station_id, :integer, index:true)
  end
end
