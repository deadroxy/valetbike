# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

file = "notes/station-data.csv"
CSV.foreach(file, :headers => true) do |row|
    station_has_kiosk = !row[2].to_i.zero?
  s = Station.new(name: row[1], address: row[6], identifier: row[0], has_kiosk: station_has_kiosk, num_docks: row[4])

  s.save
end

file = "notes/bike-data.csv"
CSV.foreach(file, :headers => true) do |row|
    b_current_station = Station.find_by(identifier: row[1])
    b = Bike.new(identifier: row[0])
    b.update(current_station: b_current_station)
    b.save
end

user = User.new(
  :first_name            => 'Elena',
  :last_name             => 'Gilbert',
  :email                 => '123456@email.com',
  :password              => 'password',
  :password_confirmation => 'password',
  :membership_id         => 000000
)
user.save!

user = User.new(
  :first_name            => 'Stefan',
  :last_name             => 'Salvatore',
  :email                 => '123457@email.com',
  :password              => 'password',
  :password_confirmation => 'password',
  :membership_id         => 000001,
  :is_admin              => true
)
user.save!

#Membership.create(identifier: 0, position: 0, name: "Pay As You Go")

membership = Membership.new(
  :identifier => 00001,
  :name              => 'Premium Monthly',
  :position          => 1,
  :payment_frequency => 90,
  :cost              => 18.5,
  :time_unit         => 'minute'
)
membership.save!

membership = Membership.new(
  :identifier => 00002,
  :name              => 'Premium Monthly',
  :position          => 2,
  :payment_frequency => 2.5,
  :cost              => 25,
  :time_unit         => 'hours'
)
membership.save!

membership = Membership.new(
  :identifier => 00003,
  :name              => 'Student Special',
  :position          => 3,
  :payment_frequency => 1,
  :cost              => 5,
  :time_unit         => 'month'
)
membership.save!