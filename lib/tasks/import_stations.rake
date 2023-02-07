require 'csv'
namespace :import do
desc "Import station data from csv file"
task :import_stations => [:environment] do

  file = "notes/station-data.csv"

  CSV.foreach(file, :headers => true) do |row|
    s = Station.new(name: row[1], address: row[6], identifier: row[0])
    s.save
  end
end
end