Overview of dev environment setup and Instructions for Populating Database:

First, make sure to update the database.yml page, so that the socket variable takes in the correct socket path name. To determine the correct socket, within the terminal, input “mysql -u root -p”. Input your MySQL password and then within the MySQL console, input “SHOW VARIABLES LIKE ‘socket’;” then press enter. The socket path will appear — copy that path into the database.yml file. In the database.yml file, there is a variable called “socket” that you can copy the path next to.
Next, enter the directory initializers in order to update _env.rb file with your username and password accordingly. If there is trouble with the _env.rb file, on lines 12 and 13 of the same database file, you might have to replace the code behind <> with ‘root’ in line 12, and your MySQL password in line 13 and make sure to manually input your password for under test and production.
In order to populate the database, first bundle install to install the gems that we used in the code. Second, call upon rake db:migrate in order to create the new tables: users and places. Then, run rake tasks "rake import_data:import_station_data" and "rake import_data:import_bike_data" Finally, rackup to call on the server and open the web page.
After you rackup, you should first see the welcome page once you click on the link to the website. If there are any issues with the link for any reason, you should be able to manually enter either of these links to access the site: http://localhost:9292/, or http://127.0.0.1:9292/. We have also deployed our website on to Heroku, so you may also use the link:
https://teamghostvaletbike.herokuapp.com to visit our website!

Functionality:

Our prototype allows the user to create an account, login to their account, visit our FAQ and about page and how our website works page, and visit our payment options. Once you have logged into our website, you will have access to our map, which lists all of the available stations and be able to unlock a bike at that station. If the station does not have any available bikes, the station will turn gray and the pop up will indicate that there are no bikes available.
On our login page, you will also be able to visit several pages: FAQ, About, and How [our website] Works. We also have a log out option that will verify if you want to log out.
You may also create an account if you do not already have an account. Once you create an account, you will be led to our payment page, where you can choose which membership to join and then pay for it (but please don’t actually)! Once you have ‘paid’, you will be able to enter our map page where all of our stations reside.

Walkthrough Steps:

We have a wonderful welcome page that has a list of buttons: Login, Create an Account, How it Works, FAQ, and About.
If you press on our About page, you can see our team information and a statement about our mission. There’s a return to welcome page button so that you can return back to the welcome page!
If you press on the FAQ button, there we have answers to some basic questions, such as how many bikes each user can rent out. If you want to return to the welcome page, there is a button at the bottom of the page that will let you do so.
If you press on the How It Works button, then you can take a look at how our website works! Similarly to before, if you want to return to the welcome page, there is a button at the bottom of the page that will let you do so
If you do not have an account, press on the Create an Account button to start the process of creating one. Alternatively, if you’ve already made your way to the Login page, there is a button in the lower half titled ‘Create an Account’ that will redirect you to the Signup page.
Once you have created an account, you will be sent to our payment page, where you can input your card information with our three available memberships on the side. Choose one of the memberships, input your information, and then press make a payment! Once you have made a payment, you will be led to our map, where you can see the stations available and a line of buttons similar to the welcome page that you can press on. If you press on a station icon on the map, a pop-up will appear showing how many bikes are currently docked at that station and a link to unlock the bike.
If the station does not have any available bikes, the station will turn grey and the link to unlock a bike will disappear.
Once you unlock a bike, please input a bike ID that is available at that station (for example bike ID: 2525 or 3849 at Florence Center Station), and then submit. Once you have submitted the bike ID, a confirmation page will appear to verify that you have checked out. On this confirmation page, there is also a button to check in your bike once you’ve finished your ride. Once you press the check in bike button, you can then select the station at which you’re checking your bike in. Once you’ve done that, you will be able to return to the page containing our map and navigation bar.
Finally, you can log out of your account from most pages.


Citations:

Help from Eli B, Yujun Shen, and Professor Brewer
https://levelup.gitconnected.com/simple-authentication-guide-with-ruby-on-rails-16a6255f0be8?gi=7a4c0880ffbc
https://github.com/axyjo/leaflet-rails
https://leafletjs.com/
http://bl.ocks.org/KoGor/81e6ce8945c43405e3e9
https://stackoverflow.com/questions/40733981/rails-cannot-load-such-file-bcrypt
https://freefrontend.com/bootstrap-payment-forms/
https://getbootstrap.com/docs/3.4/css/#buttons
https://getbootstrap.com/docs/3.4/css/
https://apidock.com/rails/ActionView/Helpers/UrlHelper/link_to
https://www.w3schools.com/bootstrap/
https://getbootstrap.com/docs/4.0/components/button-group/
https://www.py4u.net/discuss/1049477
https://stackoverflow.com/questions/13513457/rails-convert-links-to-bootstrap-buttons/13514267
https://getbootstrap.com/docs/3.3/css/
https://www.w3schools.com/w3css/default.asp
https://wtf.tw/ref/duckett.pdf
https://stackoverflow.com/questions/2831059/how-to-drop-columns-using-rails-migration
https://www.w3schools.com/bootstrap/bootstrap_dropdowns.asp
https://www.studytonight.com/bootstrap/solvedbootstrap-dropdown-not-working
https://devcenter.heroku.com/articles/heroku-cli
Week 12 Powerpoint
https://f-a.nz/dev/update-deploy-to-heroku-app/
