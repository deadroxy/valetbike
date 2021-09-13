require 'csv'
namespace :import do

    desc "Import users from CSV"
    task users: :environment do
        filename = File.join Rails.root, "users.csv"
        CSV.foreach(filename, headers: true) do |row|
            p row
            s = Station.new(name: row["name"], address: row["address"], identifier: row["identifier"]) 
            s.save
        end
    end
end