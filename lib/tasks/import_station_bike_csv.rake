require 'csv'
namespace :import_station_bike_csv do
    task :parse_data => :environment do
        station_csv = CSV.parse(File.read('notes/station-data.csv'), :headers => true)
        station_csv.each do |row|
          s = Station.new
          s.name = row[1]
          s.address = row[6]
          s.identifier = row[0]
          s.save
        end
        bike_csv = CSV.parse(File.read('notes/bike-data.csv'), :headers => true)
        station_csv.each do |row|
            b = Bike.new
            b.identifier = row[0]
            b.current_station_id = row[1]
            b.save
        end
        puts "task completed"
    end
end
