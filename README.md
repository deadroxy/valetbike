# README

## environment setup
We added `gem 'bcrypt', '~> 3.1.7` to enable `has_secure_password` function. This function would allow us to use build-in password confirmation. 

We added `gem leaflet-rails` to help with using leaflet (a javascript library for map stuff) in Ruby on Rails.

We used the same .env file as the valetbike github page describes.

## Instructions for populating the database
* Install required gems: `bundle install`
*  Run `rake db:create`
*  `rake db:migrate`
*  To import station data: `rake import_data:station['app/controllers/station-data.csv']`
*  To import bike data: `rake import_data:bike['app/controllers/bike-data.csv']`
*  `rails s` to start the app

## Description of the prototype's functionality
### User database contains email, password, and payment information
### Controllers
* SessionsController stores data for one request when the user inputs email address and password, it checks if the they match with each other
* registrationscontroller helps to create and store information of a new account
* PasswordsController helps to update password
* PasswordResetsController helps to send an email to reset the password if the user forgets the password 
* ApplicationController has functions `set_current_user` which lets other files check and use the information of the current user and `require_user_logged_in!` which lets other files show information only if user is logged in
* MapController helps to display the map
* WelcomeController helps to display the welcome page
* PaymentController helps to display the payment plan page and update user's payment status 
* RideController controls bike renting and returning functions
### Models
* users.rb in models sets the uniqueness of each email address, and requires the format of email to have a '@'
* current.rb helps to remember the current user so the current user can be used in other controllers
* ride.rb, station.rb, user.rb cooperate with each other for the riding process
### Views cooperate with Controllers to show the corresponding information



## Recommended walkthrough steps to observe key features
The welcome page displays our company's description and values; it contains buttons allowing the user to 'signup' or 'login'. 

For the first-time user, click 'signup' and enter an email address and password. The email address must contain "@" and the password and password confirmation must match with each other. 

After the sign up or log in, the sidebar will show on the screen. User can click on 'membership plan' to choose a plan and pay for it. 

Then user can click on the 'station map' button in the side bar and choose a station and click 'start' to start a ride. After clicking on the 'start' button, a timer will show on the screen. And the bike id will be displayed, too. The number of docked bikes at that station will decrease by one and the number of empty docks will increase by one. User can click on 'return bike to original station' to return the bike. The bike and dock number at that station will be changed correspondingly. The user should log in and have a payment plan before riding a bike; if they are not logged in, clicking on the 'start button' will lead them to the login page; if they do not have a payment, clicking on the 'start' button will lead them to the payment plan page.

If the user clicks on the 'account information', they can view their email, change password, cancel or join a membership plan, and logout.

'How it works' button leads to the introduction of the renting process.

Clicking 'VALETBIKE' will always bring users back to the welcome page.

## Reference

https://hixonrails.com/ruby-on-rails-tutorials/ruby-on-rails-action-mailer-configuration/
https://www.section.io/engineering-education/how-to-setup-user-authentication-from-scratch-with-rails-6/

