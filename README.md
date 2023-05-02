# README
=======
# ValetBike Bikesia
======= 
# Emma T Schumacher 
======= 
# Yina Bao
=======
# Chaira Harder 
=======
# Hamssatou Almahamoudou Maiga
=======
# Helen Yu 

This README would normally document whatever steps are necessary to get the
application up and running.

Instructions:
Make sure you have relevant gems installed: asdf, bcrypt (version 3.1.11), geocoder, and mapkick, and devise(version 4.9.11). A full list of necessary gems can be found in our Gemfile document inside of our Bikesia project folder.

Run these commands:
bundle install 
Then, set your database password in database.yml or create an .env file.

Next, run these commands:
import stations with the following commands:
rake db:import_station["notes/station-data.csv"] 
import bike data with the following commands:
rake db:import_station["notes/bike-data.csv"]
rails db:migrate

This last command will connect you to the database so you can access our site for now:
rails s

Note: If you don’t see pins on the map, then control+C out of rails s and run:
	rails db:seed
	rails s


Deployment:

Our main home page introduces our users to our company and our team. It’s also where a clear outline for how to use our website is!
For new users, simply create an account with us, or returning users can log in with their existing account.
Once you’re logged in, you have complete access to our services! Our navigation bar features a Stations option which lets users view our list of stations, and select a station they would like to rent (unlock) a bike from. On this page, users can also view a list of bikes if they wish, and unlock one after selecting their intended ride time and paying.
Click our header logo, and you’re back home! You can view your profile by clicking on ‘Profile,’ which shows your information on your current profile/account. You can edit your username, password, address, and add money to your account wallet.
Clicking home once again brings you to the main navigation bar, where you can select our map page. This is where you can visualize our stations around you and figure out how to get from one point to another. If the map doesn’t load the first time, you may need to refresh it. Specify where you want to go from, and your destination. The API we use, MapBox, is pretty smart and is able to assume most of the time with a vague address that you mean to be someplace in the Pioneer Valley.
For an example of this, type “Forbes Library” in from and “Cutter house” in to. Or, you can simply select two of our station pins! A route is automatically generated for you with directions and measurements.
Ready to return our bike? Simply click “return,” and you’re all done with your trip!
Oh no, did I hear that your bike wasn’t being returned properly on our end? Click “Report” on our navigation bar to let us know about the issue, and we’ll get back to you.
When you’re done for the day, log out!


* ...
