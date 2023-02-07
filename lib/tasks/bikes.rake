namespace :bikes do
    require 'csv'
    task :create => :environment do
       file_path = File.expand_path("~/valetbike/notes/bike-data.csv")
       CSV.foreach(file_path, headers: true) do |row|
          idno = row[0]
          bike = Bike.find_by(identifier: idno)
          bike.update(current_station: Station.find_by(identifier: row[1]))
          bike.save
       end
    end
end
