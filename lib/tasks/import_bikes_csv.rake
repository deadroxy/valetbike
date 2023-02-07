require 'csv'    
  task :import_bikes => [:environment] do

    filename = 'notes/bike-data.csv'

    CSV.foreach(filename, headers: true) do |row|
        b = Bike.new(identifier: row['identifier'])
        b.update(current_station: Station.find_by(identifier: row['current_station_identifier']))
        b.save
    end
end 

# referenced: https://dwradcliffe.com/2011/12/29/import-csv.html and Lucia


