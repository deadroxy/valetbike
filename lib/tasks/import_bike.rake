require 'csv'
namespace :import_bike_csv do
    task :import_bike => :environment do
        csv_text = File.read(Rails.root.join("notes", "bike-data.csv"))
        data = CSV.parse(csv_text, :headers => true, encoding: 'iso-8859-1')
        data.each do |row|
            b = Bike.new
            b.identifier = row['identifier']
            b.current_station_identifier = row['current_station_identifier']
            b.station_id = row['station_id']
            b.save
        end
    end
end