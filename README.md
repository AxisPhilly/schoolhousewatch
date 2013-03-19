# School Watch

School Watch is a news application to share data about the 23 public schools
closing in the School District of Philadelphia in 2013.

## Setting up locally

School Watch pulls its "recent stories" from a google spreadsheet, so 
you need to add environment variables for your Google account.

    $ touch .env
    $ vi .env

Add your environment variables.

	  export GOOGLE_DRIVE_EMAIL="your@email.com"
	  export GOOGLE_DRIVE_PASSWORD="yoursecretpassword"

Don't forget to load the variables by `source` 

	  $ source .env

You may need to install the sqlite gem. Don't add this to the Gemfile. Heroku doesn't like to see sqlite hanging around.

    $ gem install sqlite3

Set up the database:

	  $ rake db:create
	  $ rake db:migrate
	  $ rake db:import
