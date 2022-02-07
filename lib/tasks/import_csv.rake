require 'csv'
namespace :import_csv do
    desc "import csv data for stations and bikes"
    task :import_csv => :environment do
        #reading files
        station_text = File.read(Rails.root.join("notes", "station-data.csv"))
        bike_text = File.read(Rails.root.join("notes", "bike-data.csv"))
    end
end