# README

## environment setup
We added `gem 'bcrypt', '~> 3.1.7` to enable `has_secure_password` function. This function would allow us to use build-in password confirmation. 

We added `gem leaflet-rails` to help with using leaflet (a javascript library for map stuff) in ruby on rails

We used the same .env file as the valetbike github page describes.

## Instructions for populating the database
* Install required gems: `bundle install`
*  Run `rake db:create`
*  `rake db:migrate`
*  `rails s`

## Description of the prototype's functionality
### User database contains email and password
### Controllers
* SessionsController stores data for one request when the user inputs email address and password, it checks if the they match with each other
* registrationscontroller helps to create and store information of a new account
* PasswordsController helps to update password
* PasswordResetsController helps to send an email to reset the password if the user forgets the password [This one is not working right now]
* ApplicationController has functions `set_current_user` which lets other file check and use the information of the current user and `require_user_logged_in!` which lets other file show information only if user is loggin in
* MapController helps to display the map
* WelcomeController helps to display the welcome page
### Users.rb in models sets the uniqueness of each email address, and requires the format of email to have a '@'
### Views cooperate with Controllers to show the corresponding information



## Recommended walkthrough steps to observe key features
The welcome page lets the user signup or login. For the first-time user, click signup and enter an email address and password. The email address must contains "@" and the password and password confirmation must match with each other. After the sign up or log in, a map will show on the screen. And user can 'edit password' or 'log out' using the buttons below the map. There are also menu bars(will change them to sidebars in the future work) at the bottom of the page now. Click 'VALETBIKE' will bring you back to the map page, 'Membership Plan' will lead you to the membership plan page. We do not have links for other pages yet.

## Reference

https://hixonrails.com/ruby-on-rails-tutorials/ruby-on-rails-action-mailer-configuration/
https://www.section.io/engineering-education/how-to-setup-user-authentication-from-scratch-with-rails-6/

