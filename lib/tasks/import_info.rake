require 'csv'
  task :stationdata => :environment do
    csv_source = Rails.root.join("notes", "station-data.csv")
    table = CSV.parse(File.read(csv_source), headers: true)
    i = -1
    loop do
      i = i + 1
      s = Station.new(name: table[i]["name"], address: table[i]["address"], identifier: table[i]["identifier"])
      if i == 13
        break
      end
    end 
  end

  task :bikedata => :environment do
    csv_source = Rails.root.join("notes", "bike-data.csv")
    table = CSV.parse(File.read(csv_source), headers: true)
    i = -1
    loop do
      i = i + 1
      b = Bike.new(identifier: table[i][identifier])
      if i == 99
        break
      end
    end
  end