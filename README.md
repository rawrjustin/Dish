# Foodprep app

_make sure you have the required rails/ruby versions and postgres before starting_

## Getting Started
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

## Setup Troubleshooting
To install ruby 1.9.2

    sudo apt-get install rvm
    rvm install ruby-1.9.2-p290
    rvm use ruby ruby-1.9.2-p290 --default

To reset Gemfile.lcok

    rm Gemfile.lcok
    bundle install --without production

To update bundler

    gem install bundler
    bundle install

To fix Invalid Gemspec, Invalid Date Format Errors

    sudo sed -i 's/ 00:00:00.000000000Z//' /var/lib/gems/1.8/specifications/*

What I did when bundle install doesn't wanna work
* remove ruby from apt-get, keep ruby1.9.1-dev
* install ruby1.9.2 with rvm, check version with ruby -v
* gem install bundler
* bundle install

## Ruby on Rails

This application requires:

* Ruby version 1.9.3
* Rails version 3.2.7

Learn more about "Installing Rails":http://railsapps.github.com/installing-rails.html.

## Database

This application uses sqlite with ActiveRecord. and postgresql in production.

## Development gems

* Web Server: Thin
* Template Engine: Haml
* Testing Framework: RSpec and Factory Girl and Cucumber
* Authentication: Devise

## Email

The application is configured to send email using a Gmail account.

