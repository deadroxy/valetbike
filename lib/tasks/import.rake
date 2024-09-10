require 'csv'

    task :import => [:environment] do

        file = "notes/station-data.csv"
  
        CSV.foreach(file, :headers => true) do |row|
            identifier = row[0]
            name = row[1]
            address = row[6]
            s = Station.new(name: name, address: address, identifier: identifier)
            s.save
    
    end

end

    task :import => [:environment] do

        file = "notes/bike-data.csv"
  
        CSV.foreach(file, :headers => true) do |row|
            identifier = row[0]
            b = Bike.new(identifier: identifier)
            b.save
    
    end

end
