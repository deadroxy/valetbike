# this is incomplete!


require 'csv'
namespace :db do
desc "migrate bike data"
  task :migrate_stations => :environment do
  csv_text = File.join(Rails.root, 'notes', 'station-data.csv')
  csv_text = File.read(csv_text)
  csv = CSV.parse(csv_text, :headers => true)

  end 
end
end