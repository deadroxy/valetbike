require 'csv'

desc "Import stations from csv file"
task :importstations => [:environment] do

  file = "db/stations.csv"

  CSV.foreach(file, headers: true) do |row|
    Station.create(identifier: row[0], name: row[1], address: row[2])
  end

end