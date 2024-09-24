require 'csv'
desc "import bike "
task bikes: [:environment]  do
  CSV.foreach("./notes/bike-data.csv", headers: true) do |row|
    Bike.create!(
      identifier: row["identifier"],
      current_station_id: row["current_station_identifier"]
    )
  end
end
