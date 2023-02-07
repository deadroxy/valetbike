require 'csv'

namespace :importcsv do
    desc "Import CSV files"
    task station: :environment do
        stationcsv = CSV.parse(File.read("notes/station-data.csv"), headers: true)
        stationcsv.each do |row|
            s = Station.new(name: row["name"], address: row["address"], identifier: row["identifier"])
            s.save
        end
        puts "Stations imported."
    end

    task bike: :environment do
        bikecsv = CSV.parse(File.read("notes/bike-data.csv"), headers: true)
        bikecsv.each do |row|
            b = Bike.new(identifier: row["identifier"], current_station_id: row["current_station_identifier"])
            b.save
        end
        puts "Bikes imported."
    end
end