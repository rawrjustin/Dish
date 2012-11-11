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
  meal.name = 'Asian Meatballs, Salad, and Rice'
  meal.description = 'The perfect large group meal.'
  meal.servings = '200'
  meal.ingredients = 'Meatballs, salad, and rice'
  meal.directions = 'Cook meatballs at 400F for one hour.'
  meal.time_in_minutes = '60'
  meal.thumb = 'http://farm8.staticflickr.com/7270/8160380305_185c29e441.jpg'
  meal.cost = 'Under $2'
end
CookedMeal.create! do |meal|
  meal.name = 'Vietnamese Sandwiches'
  meal.description = 'Great for lunch.'
  meal.servings = '200'
  meal.ingredients = 'Vietnamese things... ask a Vietnamese person.'
  meal.directions = 'Cook stuff. Sandwichify it.'
  meal.time_in_minutes = '30'
  meal.thumb = 'http://farm8.staticflickr.com/7111/8160415698_1bb88ae465.jpg'
  meal.cost = 'Under $2'
end
CateredMeal.create! do |meal|
  meal.name = 'Hong Kong Express'
  meal.description = 'Cheap and quick, we usually order from them!'
  meal.servings = '400'
  meal.phone = '5355354422'
  meal.address = '3445 Telegraph Ave, Berkeley'
  meal.thumb = 'http://farm8.staticflickr.com/7271/8160380337_4e148bafd4.jpg'
  meal.cost = 'Under $2'
end
CookedMeal.create! do |meal|
  meal.name = 'Grilled Hotdogs'
  meal.description = 'An All-American classic.'
  meal.servings = '300'
  meal.ingredients = 'Hotdogs, buns, ketchup'
  meal.directions = '...'
  meal.time_in_minutes = '45'
  meal.thumb = 'http://farm8.staticflickr.com/7110/8160415758_6f1c3a38bc.jpg'
  meal.cost = 'Under $5'
end
