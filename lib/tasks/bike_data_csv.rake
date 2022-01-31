require 'csv'
namespace :bike_data_csv do
  task :create_bike_data => :environment do
    filename = File.join Rails.root, "notes/bike-data.csv" 
    CSV.foreach("bike-data.csv", headers = true) do |row|
  end
end 
