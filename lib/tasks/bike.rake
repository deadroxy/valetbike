namespace :bike do 
    desc "Import bikes"
    task :import => :environment do
        b = Bike.new(identifier: '9123')
        b.save 
        b = Bike.new(identifier: '4567')
        b.save 
        b = Bike.new(identifier: '8912')
        b.save 
        b = Bike.new(identifier: '3456')
        b.save 
        Bike.find_by(identifier: '1234').update(current_station: Station.find_by(name: 'Station 2'))
        Bike.find_by(identifier: '5678').update(current_station: Station.find_by(name: 'Station 3'))
        Bike.find_by(identifier: '9123').update(current_station: Station.find_by(name: 'Station 3'))
        Bike.find_by(identifier: '4567').update(current_station: Station.find_by(name: 'Station 4'))
        Bike.find_by(identifier: '8912').update(current_station: Station.find_by(name: 'Station 1'))
        Bike.find_by(identifier: '3456').update(current_station: Station.find_by(name: 'Station 2'))
    end 
end