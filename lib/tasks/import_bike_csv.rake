require 'csv'

desc "Import bikes from csv file"
task :importbikes => [:environment] do

  file = "db/bikes.csv"

  CSV.foreach(file, :headers => true) do |row|
    s = Station.find_by(identifier: row[1])
    if s == nil
      b = Bike.create(identifier: row[0])
    else
      id = s.id
      b = Bike.create(identifier: row[0], current_station: s)
      puts "#{s}, #{id}"
      puts "#{b.identifier}, #{b.current_station_id}, #{b.current_station}"
      puts "#{b.attributes}"
    end

  end

end
  # s = Station.find_by(identifier: row[1])
  #   unless s == nil
  #       b.current_station = s
  #   end