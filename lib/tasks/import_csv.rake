require 'csv'

namespace :import_csv do
   task :create_stations => :environment do
     csv_text = File.read(Rails.root.join("notes","station-data.csv"))
     csv = CSV.parse(csv_text, :headers => true, encoding:'iso-8859-1')
     csv.each do |row|
       s = Station.new;
       s.name = row["name"]
       s.address = row["address"]
       s.capacity = row["capacity"]
       s.description = row["description"]
       s.landmarksList = row["landmarks"]
       s.topLocation = row["top"]
       s.leftLocation = row["left"]
       s.image = row["image"]
       s.save
     end 
   end
 end


namespace :import_csv do
   task :create_rides => :environment do
     csv_text = File.read(Rails.root.join("notes","ride-data.csv"))
     csv = CSV.parse(csv_text, :headers => true, encoding:'iso-8859-1')
     csv.each do |row|
       s = Ride.new;
       s.name = row["name"]
       s.difficulty = row["difficulty"]
       s.length = row["length"]
       s.description = row["description"]
       s.image = row["image"]
       s.save
     end 
   end
 end

 namespace :import_csv do
   task :create_bikes => :environment do
     csv_text = File.read(Rails.root.join("notes","bike-data.csv"))
     csv = CSV.parse(csv_text, :headers => true, encoding:'iso-8859-1')
     csv.each do |row|
       s = Bike.new;
       s.current_station_id = row["stationId"]
       s.current_user_id = row["userId"]
       s.checkoutTime = row["checkoutTime"]
       s.checkinTime = row["checkinTime"]
       s.save
     end 
   end
 end
