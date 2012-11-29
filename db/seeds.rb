# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
seed_file = File.join(Rails.root, 'db', 'seed.yml')
config = YAML::load_file(seed_file)
User.create(config["users"])
Recipe.create(config["recipes"])
CookedMeal.create(config["cooked_meals"])
CateredMeal.create(config["catered_meals"])
Post.create(config["posts"])
