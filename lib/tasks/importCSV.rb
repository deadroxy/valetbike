require 'csv'

desc "Import Station Data"
task station_data: :environment do
    
    csv = File.read(Rails.root.join("notes", "station-data.csv"))
    csv = CSV.parse(filename, :headers => true)
            csv.each do |row|
                s = Station.new;
                s.identifier = row["identifier"]
                s.name = row["name"]
                s.address = row["address"]
                s.save
            end
    end


