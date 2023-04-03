require 'csv'
namespace :a1 do
    namespace :station do 
    desc "Imports a CSV file to create Stations database"
    task :import  => [:environment] do    
        file = '/Users/yonglinh/Desktop/Software/valetbike/notes/station-data.csv'
        CSV.foreach(file, :headers => true) do |row|
            station_hash = Hash.new
            station_hash[:name] = row['name']
            station_hash[:address] = row['address']
            station_hash[:identifier] = row['identifier']
            s = Station.create!(station_hash)
        end
        
    end
end
end
