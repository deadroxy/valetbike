require 'csv'
namespace :import do 
    desc "Import station data from csv files"
    task station_data: :environment do
        filename = File.read(Rails.root.join("notes", "station-data.csv"))
        csv = CSV.parse(filename, :headers => true)
        csv.each do |row|
            s = Station.new;
            s.identifier = row["identifier"]
            s.name = row["name"]
            s.address = row["address"]
            s.save
        end
    end
    desc "Import bike data from csv files"
    task bike_data: :environment do
        filename2 = File.read(Rails.root.join("notes", "bike-data.csv"))
        csv = CSV.parse(filename2, :headers => true)
        csv.each do |row|
            b = Bike.new;
            b.identifier = row["identifier"]
            b.current_station_id = row["current_station_identifier"]
            b.save
        end
    end
end