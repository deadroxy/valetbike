namespace :import_csv do
    desc "import csv data for stations and bikes"
    task :import_csv => :environment do