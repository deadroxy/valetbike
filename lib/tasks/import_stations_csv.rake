
require 'csv'
namespace :import_stations_csv do
  desc "Import station data"
  task :import_stations => :environment do
    csv_text = File.read('notes/station-data.csv')
    csv= CSV.parse(csv_text, :headers => true, :encoding => 'iso-8859-1') 
    csv.each do |row|
      station = Station.new;
      station.identifier=row["identifier"]
      station.name = row["name"]
      station.has_kiosk = row["has_kiosk"]
      station.needs_maintenance= row["needs_maintenance"]
      station.dock_count = row["dock_count"]
      station.docked_bike_count = row["docked_bike_count"]
      station.address = row["address"]
      station.save
    end
  end
end