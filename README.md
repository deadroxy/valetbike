# ValetBike

Smith College CSC223: Introduction to Software Engineering\
Starter App for ValetBike project\
Group C: Josten Kids

## General Configuration
1. Install MySQL 8.0.26
* Download: https://dev.mysql.com/downloads/mysql
* Choose "Use Legacy Password Encryption"
* After install make sure you add `/usr/local/mysql/bin` (or equivalent) to your path

2. Install Ruby 2.7.4
* Start here: https://www.ruby-lang.org/en/documentation/installation
* asdf is recommended for *nix systems, more info available on request
* Make sure you are using Ruby 2.7.4 before proceeding

3. Install Rails 6.1.4
* `gem install rails --version 6.1.4`

4. Install MySQL gem
* `gem install mysql2`

5. Clone ValetBike repo
* `git clone https://github.com/Nleek/valetbike.git`

6. Navigate to the project dir and install required gems
* `cd valetbike`
* `rails g devise:install`
* `bundle install`

7. Prepare database in MySQL
* `mysql -u root -p`
* `CREATE DATABASE valetbike_development;`

8. Run database migrations
* `rake db:migrate`

9. Populate database with seed data
* `rake db:seed`

# Environment Configurations
1. Create a new file inside of valetbike\config\initializers called '_env.rb'

2. Inside of _env.rb add the following:
* `ENV['MYSQL_USERNAME'] = <your mysql username>`
* `ENV['MYSQL_PASSWORD'] = <your mysql password>`
* MAC: `ENV['MYSQL_SOCKET'] = '/tmp.mysql.sock'` 
* WINDOWS: `ENV['MYSQL_SOCKET'] = '/var/run/mysqld.sock'`

3. Inside of the database.yml file, change username, password, and socket to:
* `username: <%= ENV['MYSQL_USERNAME'] || '' %>`
* `password: <%= ENV['MYSQL_PASSWORD'] || '' %>`
* `socket: <%= ENV['MYSQL_SOCKET'] || '' %>`

10. Confirm app runs
* `rackup`
* Open http://localhost:9292 (or http://127.0.0.1:9292) in a browser
* You should see ValetBike welcome page

# Changes Since Prototype v1.0
1. User Registration and Login
* While we did orginally have a method for the user to sign up and login, it was not very secure. We decided to redo this feature by taking advantage of the "Devise" gem. Devise provides a more secure user authentication model, in addition to many other processes such as password reset and profile editing. 
2. User Profile Page
* We added a profile page for the user where they can view and edit their current profile information. 
* With this addition, we also made sure to change the nav tabs when a user's session is active. For example, if a user is not logged in, the nav will display both "Register" and "Login" tabs. However, once the user is logged in, the nav removes "Register" and "Login" for a link to the users "Profile". 
3. Mock Payment Method
* In order to mimick the process of purchasing a membership, we added a mock payment method that collects the user's payment information. Since ValetBike is not actually in production, we don't really want to actually collect the user's payment info. 
4. Additional Stylized Pages
* We now have a few additional pages on our site:
  - About: Has information on ValetBike and some team bios + pictures!
  - Memberships: Contains details for each memebership and a link to purchase them.
  - Process: Explains how the ValetBike bike share program works.

# Description of MVP's Functionality
