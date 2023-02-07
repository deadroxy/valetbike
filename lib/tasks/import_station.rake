require 'csv'

desc "Import station from csv file"
task :import_station => [:environment] do

  file = "notes/station-data.csv"

  CSV.foreach(file, :headers => true) do |row|
    # row[i] is the ith column of the csv
    # Bike.find_by(identifier: "1234").update(current_station: Station.last)
# call rake import
    Station.create({
    :name => row[1],
    :address=> row[6],    
    :identifier => row[0]
    })
  end
end