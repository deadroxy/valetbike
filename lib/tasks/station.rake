namespace :station do 
    desc "Import stations"
    task :import => :environment do
        s = Station.new(name: 'Station 2', address: '123 Novel Lane', identifier: '10')
        s.save 
        s = Station.new(name: 'Station 3', address: '123 Novel Lane', identifier: '11')
        s.save 
        s = Station.new(name: 'Station 4', address: '123 Novel Lane', identifier: '12')
        s.save 
    end 
end