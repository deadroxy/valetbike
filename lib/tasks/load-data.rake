require 'csv'

# import the stations data
namespace :import_csv do
    task :create_stations => :environment do
        csv_text = File.read(Rails.root.join("notes", "station-data.csv"))
        csv = CSV.parse(csv_text, :headers => true, encoding: 'iso-8859-1')
        csv.each do |row|
            s = Station.new;
            s.name = row['name']
            s.address = row['address']
            s.identifier = row['identifier']
            s.has_kiosk = row['has_kiosk']
            s.needs_maintenance = row['needs_maintenance']
            s.dock_count = row['dock_count']
            s.docked_bike_count = row['docked_bike_count']
            s.save
        end
    end
end

# import the bikes data
namespace :import_csv do
    task :create_bikes => :environment do
        csv_text = File.read(Rails.root.join("notes", "bike-data.csv"))
        csv = CSV.parse(csv_text, :headers => true, encoding: 'iso-8859-1')
        csv.each do |row|
            b = Bike.new;
            b.identifier = row['identifier']
            b.current_station_identifier = row['current_station_identifier']
            b.station_id = row['station_id']
            b.save
        end
    end
end