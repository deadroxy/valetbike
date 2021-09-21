namespace :slurp do
  desc "TODO"
  task stations: :environment do
  require "csv"

  csv_text = File.read(Rails.root.join("lib", "csvs", "station-data.csv"))
  csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
  csv_text2 = File.read(Rails.root.join("lib", "csvs", "bike-data.csv"))
  csv2 = CSV.parse(csv_text2, :headers => true, :encoding => "ISO-8859-1")
  csv.each do |row|
    s = Station.new
    s.identifier = row["identifier"]
    s.name = row["name"]
    s.has_kiosk = row["has_kiosk"]
    s.needs_maintenance = row["needs_maintenance"]
    s.dock_count = row["dock_count"]
    s.docked_bike_count = row["docked_bike_count"]
    s.address = row["address"]
    s.save
    puts "#{s.name}, #{s.identifier} saved"
    csv2.each do |row2|
      #puts "#{row2["current_station_identifier"]}, #{s.identifier}"
      if row2["current_station_identifier"].to_i == s.identifier.to_i
        b = Bike.new
        b.identifier = row2["identifier"]
        #b.current_station = row["current_station_id"]
        b.current_station = s
        #b.station_id = row["station_id"]
        b.save
        #s.docked_bike_count = s.docked_bike_count + 1
        #puts "#{b.identifier}, #{b.current_station} saved"
      end
    end
  end

  puts "There are now #{Station.count} rows in the stations table"

end

end
