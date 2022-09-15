require 'csv'
namespace :import do
  
  desc "Import stations, bikes from csv"
  task data: :environment do
    bikes_data = File.join Rails.root, "notes/bike-data.csv"
    CSV.foreach(bikes_data, headers: true) do |row|
      b = Bike.new
      b.identifier = row["identifier"]
      b.current_station_id = row["current_station_id"] #i don't think the number of bikes docked are showing correctly on the web
      b.save
    end

    stations_data = File.join Rails.root, "notes/station-data.csv"
    CSV.foreach(stations_data, headers: true) do |row|
      s = Station.new
      s.name = row["name"]
      s.address = row["address"]
      s.identifier = row["identifier"]
      s.save
    end
    
    puts "hi"
  end
end








