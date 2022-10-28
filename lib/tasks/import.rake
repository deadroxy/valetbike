require 'csv'
namespace :import do
  
  desc "Import stations, bikes from csv"
  task data: :environment do

    bikes_data = File.join Rails.root, "notes/bike-data.csv"
    bike_list = CSV.foreach(bikes_data, headers: true) do |row|
      b = Bike.new
      b.identifier = row["identifier"]
      b.current_station_id = row["current_station_id"] 
      b.save
    end

    stations_data = File.join Rails.root, "notes/station-data.csv"
    station_list = CSV.foreach(stations_data, headers: true) do |row|
      s = Station.new
      s.identifier = row["identifier"]
      s.name = row["name"]
      #s.docked_bikes = row["docked_bike_count"] #want to show the docked_bikes but doesn't work
      s.address = row["address"]
      s.save
    end

    puts "hi"
  end
end








