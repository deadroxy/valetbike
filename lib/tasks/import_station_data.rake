require 'csv'
desc "importing station data from csv file"
  task :import_station_data => [:environment] do
    filename = "notes/station-data.csv" 
    CSV.foreach(filename, :headers => true) do |column|
        Station.create({:identifier => column[0], :name => column[1], :docked_bike_count => column[5], :address => column[6]})
  end
end 
