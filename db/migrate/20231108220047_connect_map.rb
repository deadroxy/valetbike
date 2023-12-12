class ConnectMap < ActiveRecord::Migration[7.0]
  def change
    add_column(:stations, :map_id, :integer, index:true)
    add_column(:routes, :map_id, :integer, index:true)
  end
end
