require 'csv'
namespace :import_bikes_csv do
  desc "Import bike data"
  task :import_bikes => :environment do
    csv_text = File.read('notes/bike-data.csv')
    csv= CSV.parse(csv_text, :headers => true, :encoding => 'iso-8859-1') 
    csv.each do |row|
      bike = Bike.new;
      bike.identifier=row["identifier"]
      bike.current_station_id = row["current_station_identifier"]
      bike.station_id = row["station_id"]
      
      bike.save
    end
  end
end