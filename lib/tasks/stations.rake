namespace :stations do
  require 'csv'


  task :create => :environment do
    file_path = File.expand_path("~/valetbike/notes/station-data.csv")
    CSV.foreach(file_path, headers: true) do |row|
        station_name = row[1]
            location = row[6]
          bike_count = row[5]
                idno = row[0]

               station = Station.new(name: station_name, address: location, identifier: idno)  
               station.save
    end
  end
end
