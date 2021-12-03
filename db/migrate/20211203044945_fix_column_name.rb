class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :bikes, :current_station_id,  :current_station_identifier
  end
end
