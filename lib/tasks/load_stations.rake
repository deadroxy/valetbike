require 'csv'
#this works! everything loaded
#code blatantly stolen from https://dwradcliffe.com/2011/12/29/import-csv.html
desc "Import stations from csv file"
task :load_stations => [:environment] do

  file = "notes/station-data.csv"
  
  CSV.foreach(file, :headers => true) do |row|
    Station.create({
      identifier: row['identifier'],
      name: row['name'],
      address: row['address']
    })
  end

end