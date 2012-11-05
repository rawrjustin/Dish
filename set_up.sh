rake db:drop
bundle install --without production
rake db:migrate
rake db:test:prepare
rake db:seed
