require 'csv'
namespace :import_csv do
    desc "import csv data for stations and bikes"
    task data: :environment do
        csv_station_text = File.read(Rails.root.join("notes", "station-data.csv"))
        csv_bike_text = File.read(Rails.root.join("notes", "bike-data.csv"))
        csv_station = CSV.parse(csv_station_text, :headers => true, :encoding => "ISO-8859-1")
        csv_bike = CSV.parse(csv_bike_text, :headers => true, :encoding => "ISO-8859-1")
        csv_station.each do |row|
            s = Station.new
            s.identifier = row["identifier"]
            s.name = row["name"]
            s.address = row["address"]
            puts "station added. #{s.name}"
        end
        csv_bike.each do |row|
            b = Bike.new
            b.identifier = row["identifier"]
            b.current_station_id = row["current_station_id"]
            puts "bike added. #{b.identifier}"
        end
    end
end

puts "done with database"