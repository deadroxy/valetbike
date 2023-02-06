require 'csv'

desc "Pull bike data from csv file"

task importBikes: [:environment] do
    station_csv = "notes/bike-data.csv"
    CSV.foreach(station_csv) do |row|
        b = Bike.new()
        b.identifier = row[0]
        sNum = row[1].to_str
        s = Station.find_by(identifier: sNum)
        b.current_station = s
        b.save 
    end
end