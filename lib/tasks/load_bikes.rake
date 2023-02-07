require 'csv'

#code blatantly stolen from https://dwradcliffe.com/2011/12/29/import-csv.html
desc "Import bikes from csv file"
task :load_bikes => [:environment] do

  file = "notes/bike-data.csv"
  
  CSV.foreach(file, :headers => true) do |row|
    b = Bike.new(identifier: row[0])
    b.update(current_station: Station.find_by(identifier: row[1]))
    b.save
  end

end