require 'csv'

class StationsController < ApplicationController
  
  def index
    @stations = Station.all.order(identifier: :asc)
    # read csv here
    # for each row in station-data.csv (column), create an instance of Station (Station.new)
    
    # file = File.basename("~/Development/valetbike/notes/station-data.csv")
    # csv = CSV.parse(File.read(file), headers: true)

    # csv.each do |row|
    #   Station.create!(row.to_hash)
    # end
  end

  def status
    # hard code station-data.csv
    # https://stackoverflow.com/questions/4410794/ruby-on-rails-import-data-from-a-csv-file
  end
  
end
