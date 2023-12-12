# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
Map.destroy_all
Map.create([{id:1}])
p "Created #{Map.count} map"

Station.destroy_all
Station.create!([{identifier: 1, name: "Smith College", address: "1 Chapin Way", map_id: 1, total_docks:15},{identifier: 2, name: "Academy of Music", address: "274 Main Street", map_id: 1, total_docks:12},{identifier: 3, name: "Stop n Shop", address: "228 King St", map_id: 1, total_docks:8}])
p "Created #{Station.count} stations"

Bike.destroy_all
Bike.create!([{id: 1, identifier: 01, current_station_id: 1},{id: 2, identifier: 02, current_station_id: 1},{id: 3, identifier: 03, current_station_id: 1},{id: 4, identifier: 04, current_station_id: 1},{id: 5, identifier: 05, current_station_id: 3},{id: 6, identifier: 06, current_station_id: 2},{id: 7, identifier: 07, current_station_id: 3}])

p "Created #{Bike.count} bikes"
Station.find { | station | station.identifier == 1}.docked_bikes << Bike.select {| bike | bike.current_station_id == 1}
Station.find { | station | station.identifier == 2}.docked_bikes << Bike.select {| bike | bike.current_station_id == 2}
Station.find { | station | station.identifier == 3}.docked_bikes << Bike.select {| bike | bike.current_station_id == 3}

Category.destroy_all
Category.create!([{id:1, name:"Nature Trails", description:"Explore natural spaces on your bike!", image_link: "https://www.pigeonforge.com/wp-content/uploads/elkmont-autumn-fall-1.jpg"},
                  {id:2, name:"Restaurants", description:"Try new places to eat!", image_link: "https://www.herofincorp.com/public/admin_assets/upload/blog/64b91a06ab1c8_food%20business%20ideas.webp"},
                  {id:3, name:"Towns", description:"Learn more about the area.", image_link: "https://newengland.com/wp-content/uploads/Northampton-D2_271.jpg"}])
p "Created #{Category.count} categories"

Route.destroy_all
Route.create!([{id:1, name:"Forest Bike Trail", startLocation:"123 Main Street", endLocation:"456 Main Street", instructions:"Go through the entrance marked with a sign. Turn left. Continue down the path until you reach the exit.", totalTime:45, map_id:1, category_id:1}])
p "Created #{Route.count} routes"

Category.find(1).routes << Route.find(1)

