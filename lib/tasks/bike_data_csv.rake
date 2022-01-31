require 'csv'
namespace :bike_data_csv do
  task :create_bike_data => :environment do
    filename = File.join Rails.root, "notes/bike-data.csv" 
  end
end 
