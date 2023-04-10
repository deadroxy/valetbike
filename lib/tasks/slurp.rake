namespace :slurp do
  desc "TODO"
  task stations: :environment do
    require 'csv'    

    csv_text = File.read('/Users/mac/Ashley/valetbike/notes/station-data.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      station = Station.new        
      station[:name] = row["name"]     
      station[:identifier] = row["identifier"]
      station[:address] = row["address"]
      station.save!
    end
  end
end
