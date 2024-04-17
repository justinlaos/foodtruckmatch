# Foodtruckmatch

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix `iex -S mix phx.server` and run the commond `Foodtruckmatch.get_daily_locations()` this will run get truck data and save it.

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Learn more
  I decided to make a table of all trucks with address and avalible items. With this table of trucks you can search for items and it will filter trucks by the items you search for. which clicking and viewing a truck, you can also click on the address to go to a google maps link. The app is set up with a Oban Cron job that runs everyday at 4am to refetch the truck location api and refresh the data in the system.

  I structured my commits to show the steps taken in creating this project.
