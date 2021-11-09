require 'csv'

namespace :import do
  desc "Import station data from a CSV file"
  task :import_station_csv => :environment do
    filename = File.read(Rails.root.join("notes", "station-data.csv"))
    csv = CSV.parse(filename, :headers => true)
    csv.each do |row|
      s = Station.new;
      s.identifier = row["identifier"];
      s.name = row["name"];
      s.address = row["address"];
      #s.docked_bikes = row["docked_bike_count"]
      s.save
    end
  end



  desc "Import bike data from a CSV file"
  task :import_station_csv => :environment do
    filename = File.read(Rails.root.join("notes", "bike-data.csv"))
    csv = CSV.parse(filename, :headers => true)
    csv.each do |row|
      b = Bike.new;
      b.identifier = row["identifier"];
      b.station = row["current_station_identifier"]
      b.stationID = row["station_id"]
      b.save
    end
  end
end
