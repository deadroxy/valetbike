require 'csv'

namespace :import do
  
  desc "Import stations from csv"
  task stations: :environment do
    # not working, so tried changing manually, but ended up just moving the file. will need to move back and resolve then
    filename = File.join Rails.root, "station-data.csv"
    # filename = /Users/katherineemerson/Development/valetbike/notes/station-data.csv
    rowCounter = 0
    importCounter = 0

    CSV.foreach(filename, :headers=> true) do |row|
      identifier, name, has_kiosk, needs_maintenance, dock_count, docked_bike_count, address = row
      station = Station.new(identifier: row['identifier'].to_i, name: row['name'], address: row['address'], has_kiosk: row['has_kiosk'].to_i, needs_maintenance: row['needs_maintenance'].to_i, dock_count: row['dock_count'].to_i)
      station.save

      # counts how many rows it checked through
      rowCounter += 1
      # counts how many new stations were saved in this runthrough
      importCounter += 1 if station.persisted?
      # print number of rows assessed for importability
      puts "ran through row #{rowCounter}"

    end

    # print the number of freshly imported stations
    puts "Imported #{importCounter} stations"
  end
end 