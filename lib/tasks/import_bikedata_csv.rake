require 'csv'
namespace :import_bikedata_csv do
    task :list_bikes => :environment do
        station_csv = CSV.parse(File.read('/Users/ZoeBuck/workspace/valetbike/notes/station-data.csv'), :headers => true) do |row|
            s = Station.new
            s.name = row[1]
            s.address = row[6]
            s.identifier = row[0]
            s.save
            bike_count = row[5]
        end
        bike_csv = CSV.parse(File.read('/Users/ZoeBuck/workspace/valetbike/notes/bike-data.csv'), :headers => true) do |row|
            b = Bike.new
            b.identifier = row[0]
            b.current_station_id = row[1]
            b.save
        end
    end
end