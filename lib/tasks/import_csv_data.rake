require 'csv'
# https://youtu.be/mTnsUyLuPgY

namespace :import_csv_data do
    desc 'import station & bike data from csv files'

    task import_station_data: :environment do
        filename = File.join Rails.root, "station-data.csv"
        CSV.foreach(filename, headers: true) do |row|
            identifier, name, has_kiosk, needs_maintenance, dock_count, docked_bike_count, address = row
            Station.create(identifier: identifier, name: name, dock_count: dock_count, docked_bikes_count: docked_bike_count, address: address)
            # puts row
        end
    end

    task import_bike_data: :environment do
        filename = File.join Rails.root, "bike-data.csv"
        CSV.foreach(filename, headers: true) do |row|
            identifier, current_station_identifier, station_id = row
            Bike.create(identifier: identifier, current_station_id: current_station_identifier, station_id: station_id)
        end
    end
end