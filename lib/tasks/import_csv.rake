require 'csv'
namespace :import_csv do
    desc "import csv data for stations and bikes"
    task data: :environment do
        csv_station_text = File.read(Rails.root.join("notes", "station-data.csv"))
        csv_bike_text = File.read(Rails.root.join("notes", "bike-data.csv"))
        csv_station = CSV.parse(csv_station_text, :headers => true, :encoding => "ISO-8859-1")
        csv_bike = CSV.parse(csv_bike_text, :headers => true, :encoding => "ISO-8859-1")
        csv_station.each do |row|
            s = Station.new(name: row["name"], address: row["address"], identifier: row["identifier"], total_docks: row["dock_count"])
            #s.identifier = row["identifier"]
            #s.name = row["name"]
            #s.address = row["address"]
            #s.total_docks = row["dock_count"]
            s.latitude = row["latitude"]
            s.longitude = row["longitude"]
            s.save
            puts "station added. #{s.name} #{s.identifier} #{s.address} #{s.total_docks} "
        end
        csv_bike.each do |row|
            b = Bike.new
            b.identifier = row["identifier"]
            b.current_station_id = row["current_station_id"]
            b.charge_level = row["charge_level"]
            b.docked = row["docked"]
            b.save
            puts "bike added. #{b.identifier} #{b.current_station_id} #{b.station_id}"
            puts "bike added. #{b.identifier}"
        end
    end
end

puts "done with database"
