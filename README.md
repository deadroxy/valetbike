ValleyScoot

Smith College CSC223: Software Engineering
Starter App for ValleyScoot project

Team: PAJAS
Team Members: Sophia Dai, Priya Dalal-Whelan, Aria Ramanathan, Jannet Martinez , Ashley Jagai 

## Overview of dev environment setup (e.g. updates to _env.rb)

**Updates to Gemfile:**
- `gem bcrypt 

**Make sure you have the following installed.  
- Ruby 
- Rails 7 
- MySQL

## Instructions for configuring database and environment 

1. bundle install`
2. `rake db:drop` (if a previous database has been created or in use)
3. `rake db:create` - Or use mysql to just create the development database with:\
  `mysql -u root -p`\
  `CREATE DATABASE valetbike_development;`\
  `CREATE DATABASE valetbike_testing;`\
4. `rake db:migrate`
If you are having errors with migration, comment out line 8 and 9 on the /db/migrate/20230411001602_create_rentals.rb
6. Open the application in an IDE or text editor. In the Slurp files, replace the file paths with the path on your own machine. 
7. Rails slurp:stations
8. Rails slurp2:bikes 
9. Launch the app using ./bin/dev . View at Localhost.3000: 

##  Changes since prototype 

The following changes were developed after the prototype.  The features are described in more detail in the description of the functionality, so we will not go into detail here. 
View available stations to rent a scoot
View available stations to return a scoot 
Rent a scoot
Return a scoot 
Edit profile 
Users parameters validation
Map with stations marker and stations’ information
Rental time tracked and credit deduction based on the rental time
Beautiful front-end 


## Complete description of the MVP's functionality
  -Create A new user:
  -Age: must be 16 or older
  -Email: must contain @ 
  -Password: at least 6 characters
  -Phone number: 10 characters
  If you entered invalid information, it won’t let you create an account and the error message will show up on the above. 
  Certain usernames are banned from registering. Each member of Pajas has the right to ban one specific name. 
  -Existing user log in: 
  (If the username and password don’t match, the error message will show up on the above)
  Review your profile, Edit your profile (including deposit more credits)
  -Existing user log out 
  -Rent a bike from the station list, which shows the availability of each station (the number of bikes at the station and the number of available docks)
  -Return a bike from the station list, which shows the availability of each station 
  -Rental time can be tracked and users edits will be deducted based on the rental time 
  -Review all stations and their availability on Map 
  -You can review through the FAQ on the help page
## Recommended walkthrough steps to observe key features
  1. Create an account
  -Age: must be 16 or older
  -Email: must contain @ 
  -Password: at least 6 characters
  -Phone number: 10 characters
  Tips: make the credit 1
  2. Check your station on the Map and see their availability 
  3. Rent a Bike 
  Click on the station, which has bikes
  Just follow the links but stay longer on the rental page, so the rental time can be long enough to deduct the credit
  Please don’t leave the rental page
  4. Return a Bike
  After your ride, click return 
  Choose a station to return the bike
  5. Done 
If your credit is negative, you should go to edit your profile and deposit more credits 

