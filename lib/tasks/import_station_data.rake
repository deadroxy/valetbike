require 'csv'
desc "importing station data from csv file"
  task :import_station_data => :environment do
    filename = "notes/station-data.csv" 
    CSV.foreach(filename, :headers => true) do |column|
        station = Station.create({identifier:column[0], name:column[1], address:column[6]})
        station.save;
  end
end 
