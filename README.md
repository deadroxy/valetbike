# ValetBike

Smith College CSC223: Introduction to Software Engineering\
Group D: Purple Cow
Yesugen Baatartogtkh, Olivia DeMeo, Carolyn Nguyen, Yujun Shen and Yutong Zhang

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

5. Install Bcrypt gem
* `gem install bcrypt -v 3.1.16`

6. Fork & clone ValetBike repo
* Click fork in the upper right hand corner of the ValetBike GitHub page
* `git clone https://github.com/<username>/valetbike.git`

7. Install gems
* `cd valetbike`
* `bundle install`

8. Prepare database in MySQL
* `mysql -u root -p`
* `CREATE DATABASE valetbike_development;`

9. Run database migrations
* `rake db:migrate`

10. Confirm app runs
* `rackup`
* Open http://localhost:9292 (or http://127.0.0.1:9292) in a browser
* You should see ValetBike welcome page
  
  
## Welcome to ValetBike!

### Overview
ValetBike offers users the ability to see a list of bike stations nearby and rent a bike for a certain period of time. Currently, users can create an account with the sign-up button or login to an existing account with the login button. There are also buttons that display a list of users that are in the database and a membership page that displays possible payment plans and connects to PayPal. Users can also see a list of nearby stations and a map that shows where each stations is. Clicking on a station triggers a menu to open with additional information.


### Exploration Tips
* Find each of the listed stations on the map
* Click on each station and see details
* Create an account using the sign-up button, then logout and login to the account just created
* Look at the list of users that are in the database
* View the membership page, select a price, and click the PayPal button which will trigger the PayPal pop-up button