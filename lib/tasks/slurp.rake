namespace :slurp do
  desc "TODO"
  task stations: :environment do
    require 'csv'    

 csv_text = File.read("/Users/priyadalal-whelan/Desktop/ashleyvaletbike/valetbike/notes/station-data.csv")

  csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
  csv.each do |row|
  puts row.to_hash
  end

  csv.each do |row|
    s = Station.new
    s.identifier = row["identifier"]
    s.has_kiosk = row["has_kiosk"]
    s.needs_maintenance = row["needs_maintenance"]
    s.dock_count = row["dock_count"]
    s.docked_bike_count = row["docked_bike_count"]
    s.address = row["address"]
    puts "#{t.identifier}, #{t.address} saved" 
  end
  
  puts "There are now #{Station.count} rows in the transactions table"

  end

 
 
 
 


end
