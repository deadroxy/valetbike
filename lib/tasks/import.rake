require 'csv'

desc "Import stations from csv file"
task :import => [:environment] do

  file = "notes/station-data.csv"

  CSV.foreach(file, :headers => true) do |column|
    Station.create ({
      :identifier => column[0],
      :name => column[1],
      :address => column[6]
    })
  end

end
