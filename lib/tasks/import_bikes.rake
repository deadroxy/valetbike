require 'csv'
namespace :import do
desc "Import bike data from csv file"
task :import_bikes => [:environment] do
    file = "notes/bike-data.csv"
    CSV.foreach(file, :headers => true) do |row|
        b_current_station = Station.find_by(identifier: row[1])
        b = Bike.new(identifier: row[0])
        b.update(current_station: b_current_station)
        b.save
    end
end
end