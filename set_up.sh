bundle install --without production
rake db:migrate db:test:prepare db:seed
