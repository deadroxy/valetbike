require 'csv'
namespace :import_data do
  desc "TODO-import data from station-data.csv"
  task import_station_data: :environment do
    csv_text = File.read(Rails.root.join("notes", "station-data.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => 'iso-8859-1')
    csv.each do |row|
      sd = Station.new;
      sd.identifier = row["identifier"]
      sd.name = row["name"]
      sd.address = row["address"]
      sd.latitude = row["latitude"]
      sd.longitude = row["longitude"]
      sd.save
    end
  end

  desc "TODO-import data from bike-data.csv"
  task import_bike_data: :environment do
    csv_text = File.read(Rails.root.join("notes", "bike-data.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => 'iso-8859-1')
    csv.each do |row|
      b = Bike.new;
      b.identifier = row["identifier"]
      b.save
    end
  end

end
