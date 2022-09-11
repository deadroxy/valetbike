require 'csv'

# TODO: Use logger instead of printing
# TODO: Duplicate code - need refactor
class LoadData
	class << self
		def load
			load_station
			load_bike
		end

		def load_station
			puts "[db] Start loading station task..."
			require './app/models/station.rb'

			CSV.foreach('./notes/station-data.csv', headers: true) do |row|
				data = {
					'identifier': row['identifier'],
					'name': row['name'],
					'address': row['address']
				}
				begin
					Station.create data
					puts "  [o] Created id #{row['identifier']} - #{row['name']}"
				rescue ActiveRecord::RecordInvalid => error
					puts "  [!] Skipped id #{row['identifier']} #{error}"
				end
			end
			puts "[db] Done loading station task..."
		end

		def load_bike
			puts "[db] Start loading bike task..."
			require './app/models/bike.rb'

			CSV.foreach('./notes/bike-data.csv', headers: true) do |row|
				data = {
					'identifier': row['identifier'],
					'current_station_id': row['current_station_identifier']
				}
				begin
					Bike.create data
					puts "  [o] Created id #{row['identifier']} at station #{row['current_station_identifier']}"
				rescue ActiveRecord::RecordInvalid => error
					puts "  [!] Skipped id #{row['identifier']} #{error}"
				end
			end
			puts "[db] Done loading bike task..."
		end

		private :load_station, :load_bike
	end
end
