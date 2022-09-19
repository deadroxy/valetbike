require 'csv'

namespace :import_csv do 
    desc "importing stations csv"
    task stations_data: :environment do 
        filename = File.read(Rails.root.join("notes", "station-data.csv"))
        csv_file = CSV.parse(filename, headers: true)

        csv_file.each do |row|
            s = Station.new;
            s.identifier = row["identifier"]
            s.name = row["name"]
            s.address = row["address"]
            s.docked_bike_count = row["docked_bike_count"]
            # s.docked_bikes = row["docked_bikes"]
            s.save
        end
    end

    desc "importing bike-data csv"
    task bike_data: :environment do 
        filename = File.read(Rails.root.join("notes", "bike-data.csv"))
        csv_file = CSV.parse(filename, headers: true)

        csv_file.each do |row|
            b = Bike.new
            b.identifier = row["identifier"]
            b.current_station_id = row["current_station_id"]
        end
    end
end
        # station_table = CSV.parse(File.read("notes/station-data.csv"), headers:true)
        # station = Station.where(id: station_table['identifier'], name: station_table['name'], address: station_table['address'], docked_bikes: station_table['docked_bike_count'])

        # CSV.foreach("notes/station-data.csv", headers: true) do |row|
            # station_table = row.to_hash
            # station = Station.where(id: station_table['identifier'], name: station_table['name'], address: station_table['address'], docked_bikes: station_table['docked_bike_count')
        # end 