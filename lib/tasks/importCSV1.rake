require 'csv'
namespace :a1 do
    namespace :bikes do 
    desc "Imports a CSV file to create Bikes database"
    task :import  => [:environment] do    
        file = '/Users/yonglinh/Desktop/Software/valetbike/notes/bike-data.csv'
        Station.new
        CSV.foreach(file, :headers => true) do |row|
            bikes_hash = Hash.new
            bikes_hash[:identifier] = row['identifier']
            i = row['current_station_identifier']
            Bike.create!(bikes_hash)
            b = Bike.find_by(identifier: row['identifier'])
            s = Station.find_by(identifier: i)
            b.current_station = s
            b.save
        end
        
    end
end
end
