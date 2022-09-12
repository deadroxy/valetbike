require 'rakefile'
require 'rake'
require 'csv'

namespace :import do

    desc "Import stations from csv"
    task stations: :environment do
        filename = File.join Rails.root, "/notes/station-data.csv"
        #csv_text = File.read('station-data.csv')
        csv = CSV.parse(filename, :headers => true)
        csv.each do |row| 
        #csv.foreach(filename :headers => true) do|row|
            p row
        end
    end

end
