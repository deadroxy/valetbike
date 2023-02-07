require 'csv'    
  task :import_stations => [:environment] do

    filename = 'notes/station-data.csv'

    CSV.foreach(filename, headers: true) do |row|
    Station.create({
      identifier: row['identifier'],
      name: row['name'],
      address: row['address']
    })
  end
end 

# referenced: https://dwradcliffe.com/2011/12/29/import-csv.html and Lucia
# all headers: identifier,name,has_kiosk,needs_maintenance,dock_count,docked_bikes_count,address


