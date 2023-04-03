require 'csv'

namespace :db do

    desc "Import bikes from CSV file"
    task :data => :environment do

        bikes_data = File.join Rails.root, "notes/bike-data.csv"
        CSV.foreach(bikes_data, headers: true) do |row|
            b = Bike.new
            b.identifier = row["identifier"]
            b.current_station = Station.find_by(identifier: row["current_station_identifier"])
            #b.current_station_id = row["current_station_identifier"]
            b.save
        end
        puts "bike data import successful."


    end        
    # puts "This is the end of importation."
end
