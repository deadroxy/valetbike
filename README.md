# STAAK ValetBike
## Dev Environment Setup
### In _env.rb:
ENV['MYSQL_USERNAME']   =   "root"
ENV['MYSQL_PASSWORD']   =   password
ENV['SOCKET'] = socket

## To Populate Database
* run `rake import_csv:create_stations`
* run `rake import_csv:create_bikes`
* run `rake import_csv:create_rides`
* For users- use signup page

## Features
* Home page 
* Map page with a list of stations and hoverable pins- click currently redirects nowhere, but will later direct to station page
* Rides page that provides a list of rides in the area
* Pricing page with information about the business model
* User signup- checks for input validity, uniqueness of username and email
* Login/logout using user details
* Rental page where a user can rent bikes- checks for number of bikes to ensure a user can rent those bikes
* Return page where a user can return rented bikes if and only if there are bikes the user has rented- calculates time and corresponding fee and displays it to the user

## Walkthrough

1. Visit main page
* Run `rackup` and go to local server to see the home page

2. Visit map page
* Using the navigation bar at the top, navigate to the map page
* If you hover over the pin, it will display the station name (currently very finicky about cursor position)

3. Visit rides and pricing page
* Use the navigation bar at the top to visit the ride and pricing pages (both static)

4. Create an account/login
* Use the navigation bar at the top to visit the signup page.
* Enter requested information. If any of the information is wrong, it will display an error.
* If the requested information is accepted, it will log you in and redirect to the home page.
* You can log out by hovering over the username and selecting "log out" from the dropdown menu. If you log in, it will accept your account information.

5. Rent bike
* Navigate to bike rental page.
* Select a station and number of bikes (cannot be less than one or more than number of bikes at station)
* Hit rent to start the timer and unlock the bikes.
* Bikes can be returned either from the button on the rent page or from the dropdown menu under the username.


  
