namespace :bikes do 
    require "csv"
    desc "create bikes"
    task import: :environment do
    
       bikes = CSV.read("Bikes.csv")
       bikes[1..-1].each do | bike |
        puts bike
        Bike.create(identifier: bike[0], current_station_id: bike[1])
       end
    end

end


