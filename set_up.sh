rake db:drop
bundle install --without production
rails g uploader image
rake db:migrate
rake db:test:prepare
rake db:seed
