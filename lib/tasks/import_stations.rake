

namespace :db do 
    desc "Import stations from a CSV file"
    task :import_stations, [:filename] => [:environment] do |task, args|
        require 'csv'
        CSV.parse(File.read(args[:filename]), headers: true).each do |row| 
            puts "Importing: #{row.to_hash["StationName"]}\n"
            import_station(row.to_hash)
        end
    end

    def import_station(item)
        station = Station.new({
            identifier: item["StationID"],
            name:       item["StationName"],
            address:    item["StationAddress"],
            capacity:   item["Capacity"],
            latitude:   item["Latitude"],
            longitude:  item["Longitude"]
        })

        if station.save
            puts "Success!\n"
        else
            puts "Failed\n"
        end

    end
end