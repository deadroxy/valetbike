# README

* Ruby version
Ruby version 3.0.2

* System dependencies
MySQL8
Rails 6.1.4

* Configuration
Install required gems by running bundle install
Run rails webpacker:install
Run rake assets:precompile

* Database creation and initialization
Run rake db:create
then run bin/rails db:migrate RAILS_ENV=development

* How to run the test suite
In your terminal launch the web app with rails s then go to http://localhost:3000 in your browser

* Description of prototype functionality
Navigation bar with links to Home, Membership, Map, Login and Register

Register functionality: create account with username and password, "forget password" option will send email to user's email address
After log in, user can edit their profile or delete their account

Membership payment functionality: Users can select a membership type and click "Buy Now!" to be redirected to Stripe checkout

Map functionality: Displays "Nipmuck Notch" (Northampton) with panning and zooming in/out

