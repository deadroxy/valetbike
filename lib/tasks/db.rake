namespace :db do
  desc "Load bikes and stations data from csv files"
  task load: :environment do
    require './lib/utils/load_data'
    LoadData::load
  end
end
