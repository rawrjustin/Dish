# Foodprep app

_make sure you have the required rails/ruby versions and postgres before starting_

## Getting Started
create two databases in postgres (installation instructions in Database section below)

    # CREATE DATABASE foodapp;
    # CREATE DATABASE foodapptest;

clone the repo

    $ git clone https://github.com/rawrjustin/foodprep.git
    $ cd foodprep
    
bundle install

    bundle install

make sure rspec and cucumber work by running these commands:
    
    rake spec
    rake cucumber

run the web server (thin)

		rails s
				
the site should be at http://localhost:3000

login with these credentials

* username: user@example.com
* password: please

happy hacking guys


## Ruby on Rails

This application requires:

* Ruby version 1.9.3
* Rails version 3.2.7

Learn more about "Installing Rails":http://railsapps.github.com/installing-rails.html.

## Database

This application uses postgresql with ActiveRecord.
if you are on a mac, install postgres.app for easy local postgres management
http://postgresapp.com/
if you are on windows or ubuntu.....google..lol sorry can't help much here but you'll just need postgres locally to be able to create a db

## Development gems

* Web Server: Thin
* Template Engine: Haml
* Testing Framework: RSpec and Factory Girl and Cucumber
* Authentication: Devise

## Email

The application is configured to send email using a Gmail account.

