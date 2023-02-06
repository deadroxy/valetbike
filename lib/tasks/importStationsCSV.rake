require 'csv'

desc "Pull station data from csv file"

task importStations: [:environment] do
    station_csv = "notes/station-data.csv"
    CSV.foreach(station_csv) do |row|
        s = Station.new()
        s.identifier = row[0]
        s.name = row[1]
        s.address = row[6]
        s.save
    end
end