require 'csv'
desc "importing bike data from csv file"
namespace :bike_data_csv do
  task :create_bike_data => [:environment] do
    filename = "notes/bike-data.csv" 
    CSV.foreach(filename, :headers => true) do |column|
        Bike.create(:identifier => column[0], :current_station => column[1], :station_id => column[2])
  end
end 
