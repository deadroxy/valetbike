require 'csv'
namespace :import do

    desc "Import users from CSV"
    task stations: :environment do
        filename = File.join Rails.root, "notes/station-data.csv"
        CSV.foreach(filename, headers: true) do |row|
            p row
            s = Station.new(name: row["name"], address: row["address"], identifier: row["identifier"]) 
            s.save
        end
    end

    task bikes: :environment do
        filename = File.join Rails.root, "notes/bike-data.csv"
        CSV.foreach(filename, headers: true) do |row|
            p row
            b = Bike.new(identifier: row["identifier"], current_station_id: row["current_station_identifier"])
            b.save
        end
    end
end