class AddFieldsToBikes < ActiveRecord::Migration[7.0]
  def change
    add_column :bikes, :current_station_identifier, :integer
    add_column :bikes, :station_id, :integer
  end
end
