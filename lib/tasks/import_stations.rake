require 'csv'
desc "Gathering station info..."
task :import_stations => :environment do
    station_info = "notes/station-data.csv"
    CSV.foreach(station_info, :headers => true) do |row|
        Station.create!(row.to_hash)
    end
end