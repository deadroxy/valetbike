namespace :import_data do
    desc "Import station data from csv file"
    task :station, [:filename] => :environment do |task, args|
      # creates valid stations listed in file. reads identifier, name, address,
      # dock_count, latitude, and longitude in the order listed in the first
      # line of the file. skips over any other attributes. skips over stations
      # with an identifier already in use.

      # rake import_data:station['app/controllers/station-data.csv']

      File.open(args[:filename], 'r') do |f|
        # store indices of identifier, name, address in hash
        h = {'identifier' => nil, 'name' => nil, 'address' => nil, 'dock_count' => nil, 'latitude' => nil, 'longitude' => nil}
  
        line1 = f.readline(chomp: true).lines(',', chomp: true)
        line1.each_index do |index|
          h[line1[index]] = index if h.has_key?(line1[index])
        end
        
  
        if h['identifier'] && h['name'] && h['address'] && h['dock_count'] && h['latitude'] && h['longitude']
          f.each(chomp: true) do |line|
            line_a = line.lines(',', chomp: true)
            if Station.find_by identifier: line_a[h['identifier']] # check id
              puts "Station #{line_a[h['identifier']]} already exists"
            else
              s = Station.new(name: line_a[h['name']], address: line_a[h['address']], identifier: line_a[h['identifier']], dock_count: line_a[h['dock_count']], latitude: line_a[h['latitude']], longitude: line_a[h['longitude']])
              s.save!
            end
          end
        else
          puts "One or more required columns missing. No new stations added."
        end
      end
    end
  
    desc "Import bike data from csv file"
    task :bike, [:filename] => :environment do |task, args|
      # creates bikes listed in file. reads identifier and current station id as
      # first and second values in each line. creates all bikes where identifier
      # contains only digits and is not already in use. assigns bike to the
      # appropriate station if current station id corresponds with a valid
      # existing station.
      File::open(args.filename, 'r') do |f|
        f.each(chomp: true) do |line|
          line_a = line.lines(',', chomp: true)
          if /\D/.match?(line_a[0])
            puts "Bike identifier #{line_a[0]} is not valid"
          elsif Bike.find_by identifier: line_a[0]
            puts "Bike #{line_a[0]} already exists"
          else
            b = Bike.new(identifier: line_a[0])
            if (s = Station.find_by identifier: line_a[1])
              b.current_station = s
            else
              puts "Station #{line_a[1]} does not exist"
            end
            b.save!
          end
        end
      end
    end
  
  end  