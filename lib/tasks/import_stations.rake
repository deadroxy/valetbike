require 'csv'

namespace :db do 
    desc "Import stations from a CSV file"
    task :import_stations => [:environment] do
        CSV.foreach("/home/ying/mydev/valetbike/valetbike/notes/station-data.csv", :headers => true) do |row| 
            Station.create ({ :identifier => row[0], :name => row[1], :address => row[6] })
        end
    end
end
        