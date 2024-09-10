require 'csv'
CSV.foreach("bike-data.csv") do |row|
    puts row.inspect
end
