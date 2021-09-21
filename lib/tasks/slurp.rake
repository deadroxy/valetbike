namespace :slurp do
  desc "Import station-data.csv"
  task stations: :environment do
    require "csv"

    csv_text = File.read(Rails.root.join("notes", "station-data.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      s = Station.new
      s.name = row["name"]
      s.address = row["address"]
      s.identifier = row["identifier"]
      s.docked_bike_count = row["docked_bike_count"]
      s.save
    end
  end

  desc "Import bike-data.csv"
  task stations: :environment do
    require "csv"

    csv_text = File.read(Rails.root.join("notes", "bike-data.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      b = Bike.new
      b.identifier = row["identifier"]
      b.current_station_id = row["current_station_identifier"]
      b.save
    end
  end

end
