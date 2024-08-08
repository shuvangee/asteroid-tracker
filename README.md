Near Earth Asteroid Tracker

NeoWs (Near Earth Object Web Service) - web service for near earth Asteroid information.
With NeoWs a user can:
Search for Asteroids based on their closest approach date to Earth
Browse the overall data-set

There are 3 pages in this website:

1. The "/" page provides introduction to NeoWs
2. The "/enter-dates" page asks the user for a date between which they want to find the asteroids 
3. The "/asteroids/results" page shows the user the list of asteroids around earth and whetehr or not they are potentially dangerous 


The github files:

1. app.rb contains the get methods 
2. views folder contains the .erb files 
3. layout.erb contains elements applied to all pages eg. black backgroud, white text, font etc
4. homepage.erb contains the html for the "/" page
5. dates.erb contains the html for the "/enter-dates" page
6. asteroids_results.erb contains the html for the "/asteroids/results" page
