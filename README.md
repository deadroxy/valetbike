# STAAK ValetBike
## Dev Environment Setup
### In _env.rb:
* ENV['MYSQL_USERNAME']   =   "root"
* ENV['MYSQL_PASSWORD']   =   password
* ENV['SOCKET'] = socket path

## To Populate Database
* run `rake import_csv:create_stations`
* run `rake import_csv:create_bikes`
* run `rake import_csv:create_rides`
* For users- use signup page

## Features
* Home page 
* Map page with a list of stations and hoverable pins - when clicked will navigate you to associated station page
* Station pages that provide go into more detail about each station
* Rides page that provides a list of rides in the area
* FAQs page with information about the business model, pricing, etc
* User signup- checks for input validity, uniqueness of username and email
* Login/logout using user details
* Rental page where a user can rent bikes- checks for number of bikes to ensure a user can rent those bikes
* Return page where a user can return rented bikes if and only if there are bikes the user has rented- calculates time, corresponding fee, and updates users' lifetime ride minutes before displaying them to the user

## Walkthrough

1. Visit main page
* Run `rackup` and go to local server to see the home page

2. Visit map page
* Using the navigation bar at the top, navigate to the map page
* A station list is provided on the left side of the page that gives you some basic information about each station
* Use the "+" and "-" buttons in the top right corner of the map to zoom in and out
* Click and drag the map with the cursor to move the map around
* If you hover over the pin, it will display the station name. Click on a station pin to natigate to its station page

3. Visit station page(s)
* Station pages can be navigated using the pins on the map or from the rides page by clicking the start/end stations of a suggested ride
* Each station page gives detailed information about the given station including: an address, bike availability/capacity, nearby landmakrs, and a description

4. Visit rides and pricing page
* Use the navigation bar at the top to visit the ride and FAQ pages (both static)

5. Create an account/login
* Use the navigation bar at the top to visit the signup page.
* Enter requested information. If any of the information is wrong, it will display an error.
* If the requested information is accepted, it will log you in and redirect to the home page.
* You can log out by hovering over the username and selecting "log out" from the dropdown menu. If you log in, it will accept your account information.

6. Rent bike
* Navigate to bike rental page.
* Select a station and number of bikes (cannot be less than one or more than number of bikes at station)
* Hit rent to start the timer and unlock the bikes.
* Bikes can be returned either from the button on the rent page or from the dropdown menu under the username.


  
