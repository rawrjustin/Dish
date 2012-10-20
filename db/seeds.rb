# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'First User', :email => 'user@example.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << user.name
user2 = User.create! :name => 'Second User', :email => 'user2@example.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << user2.name
Recipe.create! do |recipe|
  recipe.name = 'BBQ Chicken'
  recipe.description = 'The best chicken dish in the world that has the seal of approval of Sause Bause'
  recipe.ingredients = '1 whole chicken, BBQ sauce'
  recipe.directions = 'Put chicken into oven'
  recipe.time_in_minutes = '60'
  recipe.servings = '10'
  recipe.total_cost = '20'
end
Recipe.create! do |recipe|
  recipe.name = 'Lime Chicken'
  recipe.description = 'A Gideon Chia classic'
  recipe.ingredients = '1 lb of chicken, LOTS of lime juice, LOTS'
  recipe.directions = 'Stir fry chicken, dump in LOADS and LOADS of lime juice'
  recipe.time_in_minutes = '20'
  recipe.servings = '5'
  recipe.total_cost = '7'
end
