

namespace :db do 
    desc "Import bikes from a CSV file"
    task :import_bikes, [:filename] => [:environment] do |task, args|
        require 'csv'
        CSV.parse(File.read(args[:filename]), headers: true).each do |row| 
            puts "Importing: #{row.to_hash["bikeId"]}\n"
            import_bike(row.to_hash)
        end
    end

    def import_bike(item)
        bike = Bike.new({
            identifier:             item["bikeId"],
            current_station_id:     item["current_station"],
            avail:                  item["availability"]
        })

        if bike.save
            puts "Success!\n"
        else
            puts "Failed\n"
        end

    end
end