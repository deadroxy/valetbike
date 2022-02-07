require 'csv'
namespace :import_csv do
    desc "import csv data for stations and bikes"
    task stations: :environment do
    #reading files
    station_text = File.read(Rails.root.join("notes", "station-data.csv"))
    station = CSV.parse(station_text, :headers => true, :encoding => "ISO-8859-1")
    puts csv
    end
end