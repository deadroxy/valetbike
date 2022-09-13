require 'csv'
# https://youtu.be/mTnsUyLuPgY

# how to use:
# in terminal type either
# rake import_csv_data:import_station_data
# or
# rake import_csv_data:import_bike_data

namespace :import_csv_data do
    desc 'import station & bike data from csv files'

    task import_station_data: :environment do
        station_counter = 0

        CSV.foreach("/Users/bobimack/Development/valetbike/notes/station-data.csv") do |row|
            identifier, name, has_kiosk, needs_maintenance, dock_count, docked_bike_count, address = row
            station = Station.create(identifier: identifier, name: name, dock_count: dock_count, docked_bikes_count: docked_bike_count, address: address)
            puts station.errors.full_messages if station.errors.any?
            station_counter += 1 if station.persisted?
        end

        puts "Imported #{station_counter} stations"
    end

    task import_bike_data: :environment do
        bike_counter = 0

        CSV.foreach("/Users/bobimack/Development/valetbike/notes/bike-data.csv") do |row|
            identifier, current_station_identifier, station_id = row
            bike = Bike.create(identifier: identifier, current_station_id: current_station_identifier)
            puts bike.errors.full_messages if bike.errors.any?
            bike_counter += 1 if bike.persisted?
        end

        puts "Imported #{bike_counter} bikes"
    end
end