#creates csv library
require 'csv'

#creates space for rake task
namespace :db do 
    #prints out what the task is doing
    desc "Import stations from a CSV file"
    #sets up environment before running import_stations task
    task :import_stations => [:environment] do
        #iterates through the csv file
        CSV.foreach("/home/ying/mydev/valetbike/valetbike/notes/station-data.csv", :headers => true) do |row| 
            Station.create ({ :identifier => row[0], :name => row[1], :address => row[6] })
        end
    end
end
        