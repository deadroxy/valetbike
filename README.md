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

### 'Leaflet-rails'
This gem allows for functional map tiles to appear on the ValetBike map page using a separate map tileset. Without it, the map will not function correctly, and the user will only be able to access station information via the stations table.

### 'Devise'
This gem allows for users to register and log in to personal accounts associated with the ValetBike website. Without it, users will be unable to store payment info, nor will they be able to look into personal stats (e.g. previous purchases, total riding time, etc.).

### 'Pay', 'Stripe', 'Stripe-rails', 'Braintree', 'Receipts'
These gems allow for users to enter in payment information to purchase ValetBike passes to be associated with their personal accounts. Without them, users will be unable to purchase passes online, nor will they receive a receipt for their purchase.

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

## Changes made since the prototype
Since the prototype, which focused on setting up the html skeleton and creating a map with pins, we added a lot of this prototype's functionality to enhance the user's experience. We populated our pages on the navigation bar with information, used information from the csvs to populate our database, further developed our map to have pins that link to the Rent page and pins that are located on every station in our database, used Devise to allow users to register, sign up, and sign out, and allow users to rent bikes and pay.

## The prototype's functionality
Our prototype allows the user to make an account, sign in and sign out, as well as having a working interactive map. We have a navigation bar to lead to each page we thought integral to the user's experience, alongside the pages that we thought a website selling services would include.


## How to observe key features
Upon startup of the server, you will be brought to the **Home page**. Scroll down to read through a brief introduction to ValetBike. Now you can click on each of the links in our navigation bar or the footer. We suggest going to the **About Us page** first to read a small blurb on who the ValetBike system is meant for!

After reading up on ValetBike, head over to the **Sign Up page** through the Log In/Sign Up nav-link to register your own user. Note that the Log In/Sign Up nav-link turns into a "Log Out" nav-link after signing in, as well as enabling access to the "My Account" page. It is important that you create an account because you must be logged-in to rent a bike through our system.

From there, we recommend clicking on the "Rent a Bike!" button on the Home page to go to the **Map page** (or click on the Map nav-link). Notice how hovering your mouse over the map and scrolling up and down your trackpad will zoom out and zoom in on the map respectively. To zoom in and out manually, press the "+" and "-" buttons in the top left corner. Clicking and dragging on the map moves your view. Click on one of the pins on the map to view a station. This will pop up the name of the station, of which you can click on to go to the **Rent page** and rent a bike. Alternatively, click on any of the "Rent" links in the stations table below the map to go to the **Rent page** if the map is not being responsive.

Now you can purchase a one-time bike rental pass by clicking on the "Pay with Card" button! For testing purposes, enter in any email (i.e., the one associated with the account you created). Next, enter in Stripe's testing credit card information: 4242 4242 4242 4242, 04/24 (or any future date), 123. Finally, click on the "Pay $1.00" button to confirm your purchase. This should redirect you to the **Success page** if the payment was authorized.

After confirming your bike rental, navigate over to the **Pricing page** via its associated nav-link. Here, you can view the different memberships that ValetBike offers. By purchasing a pass, you can skip the hassle of entering in your payment details for future rentals.

Finally, visit the **My Account page** via its associated nav-link to view your account details. Currently, you can view the email associated with your account, the date of your account's creation, and the total number of rides associated with your account. Feel free to log out of your account at this point by pressing on the "Log Out" nav-link. This will allow you to log in to a different account, create a new account for someone else, or simply keep your account secure in the event that you're accessing the website on a shared device.

Confused on how ValetBike works? Unsure on how to navigate the website? Access the **Help page** by clicking on the Help nav-link to view frequently asked questions.


