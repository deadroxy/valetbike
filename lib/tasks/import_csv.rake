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
            b.current_station_id = row[1]
            b.save
            puts "bike added. #{b.identifier} #{b.current_station_id}"
        end

        csv_membership_text = File.read(Rails.root.join("notes", "membership-data.csv"))
        csv_membership = CSV.parse(csv_membership_text, :headers => true, :encoding => "ISO-8859-1")

        csv_membership.each do |row|
            b = Membership.new
            b.name = row["name"]
            b.price = row["price"]
            b.save
            puts "membership added. #{b.name}"
        end

    end
end

puts "done with database"
