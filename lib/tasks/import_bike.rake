# This task imports station data from a CV file
# Use before importing bike data
# Usage: rake db:import_bikes["notes/bike-data.csv"]

namespace :db do

    desc "Import bike data from csv file"

    task :import_bikes, [:filename] => :environment do |task, args| 
        require 'csv'
    
        puts "Importing bike data..."

        CSV.parse(File.read(args[:filename]), headers: true).each do |row|
            puts "Importing: #{row.to_hash["identifier"]}\n" 
            import_bike(row.to_hash)
        end 
    end

    def import_bike(item)
        bike = Bike.new({
            identifier: item["identifier"], 
            current_station_id: item["current_station_identifier"]})
            
        if bike.save
            puts "Successfully imported: #{item["identifier"]}\n"
        else
            puts "Failed to import: #{item["identifier"]}\n"
        end
    end
end
