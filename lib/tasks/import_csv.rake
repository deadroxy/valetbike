require 'csv'
namespace :import_csv do

    desc "Import station and bike data from csv file"
    task :parse_data => :environment do

        station_csv = CSV.parse(File.read('notes/station-data.csv'), :headers => true) do |row|
          s = Station.new  
          s.identifier = row[0]
          s.name = row[1]
          s.address = row[6]
          s.save
        end

        bike_csv = CSV.parse(File.read('notes/bike-data.csv'), :headers => true) do |row|
            b = Bike.new
            b.identifier = row[0]
            b.current_station_id = row[1]
            b.save
        end
        puts "yeah"
    end
end