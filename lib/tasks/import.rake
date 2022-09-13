require 'csv'
namespace :import do
    desc "Import stations from csv"
    task data: :environment do
        stations_data = File.join Rails.root, "notes/station-data.csv"
        CSV.foreach(stations_data, headers: true) do |row|
            s = Station.new
            s.name = row["name"]
            s.address = row["address"]
            s.identifier = row["identifier"]
            s.save
        end

        bikes_data = File.join Rails.root, "notes/bike-data.csv"
        CSV.foreach(bikes_data, headers: true) do |row|
            b = Bike.new
            b.identifier = row["identifier"]
            b.current_station_id = row["current_station_id"] 
            b.save
        end
    end
end