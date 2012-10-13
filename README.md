# Foodprepapp

## Getting Started

clone the repo

    git clone https://github.com/rawrjustin/foodprep.git

make sure rspec and cucumber work by running these commands:

    rake spec
    cucumber

run the web server (thin)
				
				rails s
				
the site should be at http://localhost:3000

Preferences:
{:git=>true, :railsapps=>"rails3-devise-rspec-cucumber", :database=>"sqlite", :unit_test=>"rspec", :integration=>"cucumber", :fixtures=>"factory_girl", :frontend=>"none", :email=>"gmail", :authentication=>"devise", :devise_modules=>"default", :authorization=>"none", :starter_app=>"users_app", :form_builder=>"none", :quiet_assets=>true, :dev_webserver=>"thin", :prod_webserver=>"thin", :templates=>"haml", :github=>true}

## Ruby on Rails

This application requires:

* Ruby version 1.9.3
* Rails version 3.2.7

Learn more about "Installing Rails":http://railsapps.github.com/installing-rails.html.

## Database

This application uses SQLite with ActiveRecord.

## Development

* Template Engine: Haml
* Testing Framework: RSpec and Factory Girl and Cucumber
* Front-end Framework: None
* Form Builder: None
* Authentication: Devise
* Authorization: None

## Email

The application is configured to send email using a Gmail account.

