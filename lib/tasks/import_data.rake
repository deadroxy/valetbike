require 'csv'

namespace :import_data do

    desc "Import stations from CSV file"
    task data: :environment do

        stations_data = File.read(Rails.root.join("notes", "station-data.csv"))
        csv = CSV.parse(stations_data, :headers => true, :encoding => "ISO-8859-1")
        csv.each do |row|
          s = Station.new
          s.name = row["name"]
          s.address = row["address"]
          s.identifier = row["identifier"]
          s.dock_count = row["dock_count"]
          s.docked_bike_count = row["docked_bike_count"]
          s.save
        end
        bikes_data = File.join Rails.root, "notes/bike-data.csv"
        CSV.foreach(bikes_data, headers: true) do |row|
            b = Bike.new
            b.identifier = row["identifier"]
            b.current_station = Station.find_by(identifier: row["current_station_identifier"])
            b.save
        end
    end        
    # puts "This is the end of importation."
end