class AddStationsAttributes < ActiveRecord::Migration[7.0]
  def change
    
    add_column :stations, :has_kiosk, :boolean 
    add_column :stations, :needs_maintenance, :boolean 
    add_column :stations, :dock_count, :integer 
    add_column :stations, :docked_bike_count, :integer 
    add_column :stations, :bikes_at_station, :string 
    add_column :stations, :is_full, :boolean 
      # s. = row["has_kiosk"] # 0 false 1 true
      # s. = row["needs_maintenance"] # 0 false 1 true
      # s. = row["dock_count"] #int
      # s. = row["docked_bike_count"] #int
      # s. = Array.new(s.dock_count) #int array
      # s. = true #boolean
      
      
  end
end
