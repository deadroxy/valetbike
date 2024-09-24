require 'csv'
desc "import station locations"
task stations: [:environment]  do
  CSV.foreach("./notes/station-data.csv", headers: true) do |row|
     Station.create!(
      identifier: row["identifier"],
      name: row["name"],
      address: row["address"]
    )
  end
task bikes: [:environment]  do
  CSV.foreach("./notes/bike-data.csv", headers: true) do |row|
    Bike.create!(
      identifier: row["identifier"],
      current_station_id: row["current_station_identifier"]
    )
  end
 
end 
