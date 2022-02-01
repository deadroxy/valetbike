require 'csv'
desc "importing station data from csv file"
task :import_bikes => :environment do
  filename = "notes/bike-data.csv"
  CSV.foreach(filename, :headers => true) do |row|
      (b = Bike.new(:identifier => row['identifier'], :current_station_id => row['current_station_identifier']);
      b.save;
      )
    end
end
