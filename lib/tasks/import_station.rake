require 'csv'
namespace :import_csv do
    task :import_station => :environment do
        csv_text = File.read(Rails.root.join("notes", "station-data.csv"))
        data = CSV.parse(csv_text, :headers => true, encoding: 'iso-8859-1')
        data.each do |row|
            s = Station.new
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
