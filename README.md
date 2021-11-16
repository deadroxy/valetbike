# Prototype for ValetBike
Smith College CSC223: Introduction to Software Engineering\
Group EEEee: Grace Li, Tevy Bong, Winnie Zong, Liwen Xu, Yanning Tan

## General Configuration
1. Install MySQL 8.0.26
* Download: https://dev.mysql.com/downloads/mysql
* Choose "Use Legacy Password Encryption"
* After install make sure you add `/usr/local/mysql/bin` (or equivalent) to your path

2. Install Ruby 3.0.2
* Start here: https://www.ruby-lang.org/en/documentation/installation
* asdf is recommended for *nix systems, more info available on request
* Make sure you are using Ruby 3.0.2 before proceeding

3. Install Rails 6.1.4
* `gem install rails --version 6.1.4`

4. Install MySQL gem
* `gem install mysql2`

5. Clone our ValetBike repo
* `git clone https://github.com/Tevy-B/valetbike.git`

6. Install gems
* `cd valetbike`
* `bundle install`

7. Prepare database in MySQL
* `mysql -u root -p`
* `CREATE DATABASE valetbike_development;`
* run `mysql -u root -p valetbike_development < valetbike_development.sql` to import database

8. Run database migrations
* `rake db:migrate`

9. Confirm app runs
* `USERNAME=your_own_sql_username PASSWORD=your_own_sql_password  rails s`
* Open http://localhost:9292 (or http://127.0.0.1:9292) in a browser
* You should see ValetBike welcome page

## Frequent Encountered Questions
1. The `USERNAME=your_own_sql_username PASSWORD=your_own_sql_password` should successfully setup the credential,\
but if there is still a `Access denied for user 'root'@'localhost' (using password: YES)` error:\
Try to add /config/initializers/_env.rb in your app with your mysql username/password like this:\
`ENV['MYSQL_USERNAME'] = "your_own_sql_username"`\
`ENV['MYSQL_PASSWORD'] = "your_own_sql_password"`

## Prototype's Functionality
* **User management (enabled by `devise gem`):** The user can sign up by clicking the link in the navigation bar. When entering email information, there must be an “@” in the email address. When setting a password the length of the password has to be more than 6 characters and the reentered password has to be the same as the original one. The user can then login using the email address and the password to login. After logging in, the user can use the sign out button to sign out and they can also use the edit profile button to edit their email address and password.

* **Customer Service:** At the bottom of the main page after login, which is “Display Stations and Bikes,” There’s a link named “Customer Services” that will lead the user to a page that has the contact information of ValetBike. The user could email or call us, or they can submit an online message in the “Message” box on that page.

* **Borrow & Return:** After clicking on the “Display Stations and Bikes”, a list of stations will be shown. On each station, there is a link “show bike”, which will navigate the user to the specific dock. In each dock a list of bikes(with current station id same as the id of the station) will appear. Users could click the “Borrow the Bike!” link to borrow the bike by typing in the bike identifier(only the identifiers of bikes within the station will work). Users could also click the “Return the Bike” and type in the bike identifier to return the bike in any station they want.

* **Billing:** After clicking on the “Billing” in the nav bar, two ways of billing will be shown: mastercard or VISA. After clicking on the payment option you choose, users are required to input their payment information( holder name, card number, cvv, expiration date), these input can not be empty. The card number and cvv can only be numbers with length no more than 16 for card number and 3 for cvv. After inputting proper value, the information will be stored and the user will see “You successfully input billing information. Thank you!!!” and will be able to get to the home page.

## Recommended Walkthrough
