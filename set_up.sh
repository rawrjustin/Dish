bundle install --without production
rails g uploader image
rake db:drop
rake db:migrate db:test:prepare db:seed
