namespace :stations do 
    require "csv"
    desc "create stations"
    task import: :environment do
    
       stations = CSV.read("Stations.csv")
       stations[1..-1].each do | station |
        puts station
        Station.create(identifier: station[0], name: station[1], address: station[2])
       end
    end

end
