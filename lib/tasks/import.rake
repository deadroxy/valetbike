require 'csv'

namespace :import_data do
  desc "Import station data from csv file"
  task import_stations: :environment do
    
    csv_text = File.read(Rails.root.join("notes", "station-data.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => 'iso-8859-1')
 
    csv.each do |row|
      new_station = Station.new;
      new_station.identifier = row["identifier"]
      new_station.name = row["name"]
      new_station.has_kiosk = row["has_kiosk"]
      new_station.needs_maintenance = row["needs_maintenance"]
      new_station.dock_count = row["dock_count"]
      new_station.docked_bike_count = row["docked_bike_count"]
      new_station.address = row["address"]
      new_station.save
    end
  end

  desc "import data from bike-data.csv"
  task import_bikes: :environment do 

    csv_text = File.read(Rails.root.join("notes", "bike-data.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => 'iso-8859-1')

    csv.each do |row|
      new_bike = Bike.new; 
      new_bike.identifier = row["identifier"]
      new_bike.current_station_id = row["current_station_identifier"]
      new_bike.save
    end
  end
  
end 