# rake db:import_station["notes/station-data.csv"]

namespace :db do

    desc "Import station data from csv file"

    task :import_station, [:filename] => :environment do |task, args|
        require 'csv'

        puts "Importings station data..."

        CSV.parse(File.read(args[:filename]), headers: true).each do |row|
            puts "Importing: #{row.to_hash["name"]}\n"
            import_station(row.to_hash)
        end
    end

    def import_station(item)
        station = Station.new({
            identifier: item["identifier"],
            name: item["name"],
            address: item["address"]})

        if station.save
            puts "Successfully imported: #{item["name"]}\n"
        else
            puts "Failed to import: #{item["name"]}\n"
        end
    end

end