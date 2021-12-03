Overview of dev environment setup and Instructions for Populating Database:
First, make sure to update the database.yml page, so that the socket variable takes in the correct socket path name. Then enter the directory initializers in order to update _env.rb file with your username and password accordingly. If there is trouble with the _env.rb file, on lines 12 and 13 of the same database file, you might have to replace the code behind <> with ‘root’ in line 12, and your MySQL password in line 13 and make sure to manually input your password for under test and production.

In order to populate the database, first bundle install to install the gems that we used in the code. Second, call upon rake db:migrate in order to create the new tables: users and places. Then, run rake tasks "rake import_data:import_station_data" and "rake import_data:import_bike_data" Finally, rackup to call on the server and open the web page.

You should first see the welcome page once you click on the website name that appears once you rackup. If there are any issues with the link for any reason, you should be able to manually enter either of these links to access: http://localhost:9292/, or http://127.0.0.1:9292/.

Functionality:
Our prototype allows the user to create an account and log in to our website. Only once they have logged into our website, they are then able to view our map, containing the information about our stations with a nice logo.

Walkthrough Steps:
In the welcome page, there are two buttons: login and signup.
First, click on the sign-up page in order to create an account. Once you have signed up, the page will redirect you to the login page, where you will input your username and password.
Once you have inputted your username and password from the login page, the page will redirect you to an authorized page that displays our map that displays all of the stations.

Note: if you try to sign up with a non-existing account, you will stay on the login page. To return back to the welcome page to create a new account, you can press the back button until you reach the welcome page, or go to the URL and type in welcome after the “/”.

Also, due to the fact that we have yet to implement logging out functionalities, once you have already created an account and logged in you will immediately be redirected to the authorized page containing the map. In order to see all the pages again, you can either restart the process in a new browser (say, Safari or Opera if you’ve used Chrome), or comment out line 11 in /app/views/sessions/welcome.html.erb - as a reminder, comments in HTML must be formatted as such: <!-- this is a comment -->.

Citations:
https://levelup.gitconnected.com/simple-authentication-guide-with-ruby-on-rails-16a6255f0be8?gi=7a4c0880ffbc
https://github.com/axyjo/leaflet-rails
https://leafletjs.com/
http://bl.ocks.org/KoGor/81e6ce8945c43405e3e9
https://stackoverflow.com/questions/40733981/rails-cannot-load-such-file-bcrypt
