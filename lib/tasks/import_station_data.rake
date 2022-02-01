require 'csv'
desc "importing station data from csv file"
<<<<<<< HEAD
task :import_stations => :environment do
  filename = "notes/station-data.csv"
  CSV.foreach(filename, :headers => true) do |row|
    Station.create!(row.to_hash)
  end
end
=======
  task :import_station_data => [:environment] do
    filename = "notes/station-data.csv" 
    CSV.foreach(filename, :headers => true) do |column|
        Station.create({:identifier => column[0], :name => column[1], :docked_bike_count => column[5], :address => column[6]})
  end
end 
>>>>>>> 4b7f8a7d4f059e9ffbd0a88a817e918a18c3d057
