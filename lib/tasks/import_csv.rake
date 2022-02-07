require 'csv'
namespace :import_csv do
    desc "import csv data for stations and bikes"
    task stations: :environment do
    #reading files
    station_text = File.read(Rails.root.join("notes", "station-data.csv"))
    puts station_text
    end
end