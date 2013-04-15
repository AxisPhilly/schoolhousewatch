# Schoolhouse Watch

Schoolhouse Watch is a news application to share data about the 22 public schools
slated to close in the School District of Philadelphia in 2013.

## Setting up locally

Schoolhouse Watch pulls its "resources" from a google spreadsheet, so 
you need to add environment variables for your Google account.

    $ vi .env

Add your environment variables.

    export GOOGLE_DRIVE_EMAIL="your@email.com"
    export GOOGLE_DRIVE_PASSWORD="yoursecretpassword"

Then, to quit VIM, type `:wq` and hit enter.

Don't forget to load the variables by `source` 

    $ source .env

To install the project dependencies, run

    $ bundle install

Set up the database:

    $ rake db:create
    $ rake db:migrate
    $ rake db:import

Start the server:

    $ rails s