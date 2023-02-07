require 'csv'

desc "Import teams from csv file"
task :import => [:environment] do

  file = "notes/station-data.csv"
  
  CSV.foreach(file, :headers => true) do |row|
    Station.create {
        Station.new(name: row[1], address: row[7], identifier: row[0])
    }
  end

end

# identifier,current_station_identifier,station_id