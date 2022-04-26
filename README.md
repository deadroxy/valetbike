# csc223-cloaf (Group C)

## Additional dev environment setup
In this fork of the [deadroxy/valetbike repo](https://github.com/deadroxy/valetbike), several additional gems were added to the `Gemfile`: 
1. `gem 'leaflet-rails'`
2. `gem 'devise'`
3. `gem 'stripe'`
4. `gem 'stripe-rails'`
5. `gem 'braintree'`
6. `gem 'pay'`
7. `gem 'receipts'`
8. `gem 'sqlite3'`

### 'Leaflet-rails'
This gem allows for functional map tiles to appear on the ValetBike map page using a separate map tileset. Without it, the map will not function correctly, and the user will only be able to access station information via the stations table.

### 'Devise'
This gem allows for users to register and log in to personal accounts associated with the ValetBike website. Without it, users will be unable to store payment info, nor will they be able to look into personal stats (e.g. previous purchases, total riding time, etc.).

### 'Pay', 'Stripe', 'Stripe-rails', 'Braintree', 'Receipts'
Thse gem allows for users to enter in payment information to purchase ValetBike passes to be associated with their personal accounts. Without them, users will be unable to purchase passes online, nor will they receive a receipt for their purchase.

Verify that all of these gems are located at the bottom of the `Gemfile`
* If they are missing, add them to the bottom of the `Gemfile`.

Finally, install the missing gems by running `bundle install`.

### Updates to .env
For your personal .env file, be sure to set two API keys to enable Stripe functionality. These variables should be named `STRIPE_SECRET_KEY` and `STRIPE_PUBLISHABLE_KEY` to ensure that the API can be accessed through all relevant pages.

* ex. `STRIPE_SECRET_KEY='sk_test_randomstringofcharacters'`
* ex. `STRIPE_PUBLISHABLE_KEY='pk_test_randomstringofcharacters'`

## Populating the database
Since we are using Devise, our database is populated by Devise each time a user registers.

Note, if you have old data populating the stations database, you should do the following:

1. Open the mysql console using `mysql -u root -p`
2. Check the database exists by typing `SHOW DATABASES;`
3. Then delete the database through `DROP DATABASE valetbike_development;`
4. Check that the database was deleted with the command from step 2
5. To recreate the database, use `CREATE DATABASE valetbike_development;`. Exit the console by typing `quit`
6. Run the migrations with `rake db:migrate`
7. Import stations and bikes by using `rake import_data:import_stations` and `rake import_data:import_bikes`    

## The prototype's functionality
Our prototype allows the user to make an account, sign in and sign out, as well as having a working interactive map. We have a navigation bar to lead to each page we thought integral to the user's experience, alongside the pages that we thought a website selling things would include.

## How to observe key features
Upon startup of the server, you will be brought to the **Home page**. 

From there, we recommend clicking on the "Rent a Bike!" link to go to the **Map page**. Notice how hovering your mouse over the map and scrolling up and down your trackpad will zoom out and zoom in on the map respectively. To zoom in and out manually, press the "+" and "-" buttons in the top left corner. Clicking and dragging on the map moves your view. Next, click on the "Rent" link to go to the **Rent page**.

Now you can click on each of the links in our navigation bar or the footer. We suggest going to the **Sign Up page** through the "Log In/Sign Up" then "Sign Up" link to register your own user. Note that the "Log In/Sign Up" link turns into a "Log Out" link after signing in.


