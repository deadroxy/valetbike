# The following websites were used to produce this rake file: 
# - https://www.rubyguides.com/2019/02/ruby-rake/, 
# - https://dwradcliffe.com/2011/12/29/import-csv.html
# I also received help from Phuong during TA hours

require 'csv'

namespace :import do

    desc "Import station-data from csv"
    task station_data: :environment do
        CSV.foreach("notes/station-data.csv", headers: true) do |row|
             s_identifier = row[0]
             s_name = row[1]
             s_address = row[6]
             s = Station.new(name: s_name, address: s_address, identifier: s_identifier)
             s.save
        end
    end
end