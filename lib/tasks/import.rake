require 'csv'
  desc "Import station data"
  task import: :environment do
    station = File.join Rails.root, "notes/station-data.csv"
    CSV.foreach(station, headers: true) do |row|
      s = Station.new
      s.identifier = row["identifier"]
      s.name = row["name"]
      s.address = row["address"]
      s.save
    end
  end
  desc "Import bike data"
  task bikes: :environment do
    bike= File.join Rails.root, "notes/bike-data.csv"
    CSV.foreach(bike, headers: true) do |row|
      b = Bike.new
      b.identifier = row["identifier"]
      b.current_station_id = row["current_station_identifier"]
      b.save
    end
  end
