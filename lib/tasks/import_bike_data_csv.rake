# The following websites were used to produce this rake file: 
# - https://www.rubyguides.com/2019/02/ruby-rake/, 
# - https://dwradcliffe.com/2011/12/29/import-csv.html
# I also received help from Phuong during TA hours

require 'csv'

namespace :import do

    desc "Import station-data from csv"
    task bike_data: :environment do
        CSV.foreach("notes/bike-data.csv", headers: true) do |row|
             b_identifier = row[0]
             b_current_station_identifier = row[1]

             # find the current station using the station id
             b_current_station = Station.find_by(identifier: b_current_station_identifier)
             
             b = Bike.new(identifier: b_identifier)
             b.update(current_station: b_current_station)
             b.save
        end
    end
end