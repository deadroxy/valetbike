require 'csv'
namespace :import_station_datv do
  task :create_station_data => :environment do
    filename = File.join Rails.root, "notes/station-data.csv" 
    CSV.foreach("station-data.csv", headers = true) do |row|
        station = Station.new(identifier:row["name"]); 
        station.save;
  end
end 
