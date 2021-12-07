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

10. Create a `_env.rb` file inside config/initializers. This file should define three environment variables, according to your MySql user:
* `ENV['MYSQL_USERNAME']`
* `ENV['MYSQL_PASSWORD']`
* `ENV['MYSQL_SOCKET']`

11. Confirm app runs
* `rackup`
* Open http://localhost:9292 (or http://127.0.0.1:9292) in a browser
* You should see ValetBike welcome page

### DevEnviroment and Database
To set up the _env.rb file, put in your local mysql username and password.
Use rake tasks to populate the database.
  
### Changes Since Prototype:
This version of ValetBike has updates to the user's abilities and some bugs fixed. Users can now navigate through the website's pages while staying logged in. Additional features including renting and returning a bike were added as user features.
  
## Welcome to ValetBike!

### Overview
ValetBike users can see a list of nearby bike stations and rent a bike for a certain period of time. On the main webpage, there is a map displaying the location of nearby stations, as well as a list of each stations and the available bikes. Users can create an account with the sign-up button or login to an existing account with the login button. When logged in, the user can then see the the user profile page and the payment page. The user profile page with a log-out button and the user's information, which can be edited. The payment page displays possible membership plans and connects to PayPal to complete the transaction. There is also a rent a bike page, which will direct users that aren't logged in to the log-in page. When logged in, the user can choose which station to rent from and then will be directed to the payment page to complete the purchase. Logged-in users can also see a return bike page, which allows users to choose a station to return their bikes to.


### Exploration Tips
* Find each of the listed stations on the map
* Click on each station and see details
* Create an account using the sign-up button, then logout and login to the account just created
* Rent a bike from one of our stations! Then see how that bike is now no longer listed as available on the main page
* View the membership page, select a price, and click the PayPal button which will trigger the PayPal pop-up button
* View the user profile and change the email, username, or password