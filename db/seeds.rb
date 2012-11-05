# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'First User', :email => 'user1@example.com', :password => 'please', :password_confirmation => 'please'
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
CookedMeal.create! do |meal|
  meal.name = 'BBQ Pork and Salad'
  meal.description = 'Cheap and tasty!'
  meal.servings = '200'
  meal.ingredients = 'Pork and veggies'
  meal.directions = 'Cook pork and mix veggies'
  meal.time_in_minutes = '50'
end
CateredMeal.create! do |meal|
  meal.name = 'Hong Kong Express'
  meal.description = 'Cheap and quick, we usually order from them!'
  meal.servings = '400'
  meal.phone = '5355354422'
  meal.address = '3445 Telegraph Ave, Berkeley'
end
