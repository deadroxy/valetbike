require 'csv'

desc "Import bike from csv file"
task :import_bike => [:environment] do

  file = "notes/bike-data.csv"

  CSV.foreach(file, :headers => true) do |row|
    # row[i] is the ith column of the csv
    # Bike.find_by(identifier: "1234").update(current_station: Station.last)
# call rake import
    b = Bike.new(identifier: row[0])
    s = Station.find_by(identifier: row[1])
    Bike.find_by(identifier: row[0]).update(current_station: s)
    s.save
  end
end