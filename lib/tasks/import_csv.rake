require 'csv'


namespace :import_csv do
  task :create_stations, [:pathname] => :environment do |t, args|
    csv_text = File.read(args[:pathname])
    csv = CSV.parse(csv_text, :headers => true, encoding:'iso-8859-1', quote_char: "'")
    csv.each do |row|
      s = Station.new;
      s.name = row["name"]
      s.identifier = row["identifier"]
      s.address = row["address"]
      s.save
    end 
  end
end

namespace :import_csv do
  task :create_bikes, [:pathname] => :environment do |t, args|
    csv_text = File.read(args[:pathname])
    csv = CSV.parse(csv_text, :headers => true, encoding:'iso-8859-1', quote_char: "'")
    csv.each do |row|
      s = Bike.new;
      s.identifier = row["identifier"]
      s.current_station = Station.find(row["station"])
      s.save
    end 
  end
end 

