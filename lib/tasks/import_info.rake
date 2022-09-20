require 'csv'

  task :stationdata => :environment do
    puts "starting job"
    csv_source = Rails.root.join("notes", "station-data.csv")
    table = CSV.parse(File.read(csv_source), headers: true)
    i = -1
    loop do
      i = i + 1
      s = Station.new(name: table[i]["name"], address: table[i]["address"], identifier: table[i]["identifier"])
      s.save
      if i == 13
        break
      end
    end
    puts "finished job" 
  end

  task :bikedata => :environment do
    csv_source = Rails.root.join("notes", "bike-data.csv")
    table = CSV.parse(File.read(csv_source), headers: true)
    csv_station_source = Rails.root.join("notes", "station-data.csv")
    station_table = CSV.parse(File.read(csv_station_source), headers: true)
    n = Station.new(name: "No Station Assigned", address: "No Adress", identifier: "404")
    n.save
    i = -1
    loop do
      i = i + 1
      b = Bike.new(identifier: table[i]["identifier"])
      b.current_station_id = table[i]["current_station_identifier"]
      puts b.current_station
      b.save
      if i == 99
        break
      end
    end
  end