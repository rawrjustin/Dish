# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or create!d alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create!([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create!(name: 'Emanuel', city: cities.first)
seed_file = File.join(Rails.root, 'db', 'seed.yml')
config = YAML::load_file(seed_file)
#User.create!(config["users"])
#Post.create!(config["posts"])
#Location.create!(config["locations"])
#config["ingredients"].each do |ingredient|
  #location_name = ingredient["location"]
  #ingredient["location"] = Location.find_by_name(location_name)
  #Ingredient.create!(ingredient)
#end
#config["recipes"].each do |recipe|
  #ingredient_list = recipe.delete("ingredients")
  #rec = Recipe.create!(recipe)
  #if ingredient_list
    #ingredient_list.each do |ingredient|
      #ing = Ingredient.find_by_name(ingredient["name"])
      #RecipeIngredient.create! do |r|
        #r.recipe = rec
        #r.ingredient = ing
        #r.amount = ingredient["size"]
      #end
    #end
  #end
#end
config["cooked_meals"].each do |meal|
  ingredient_list = meal.delete("ingredients")
  m = CookedMeal.create!(meal)
  if ingredient_list
    ingredient_list.each do |ingredient|
      ing = Ingredient.find_by_name(ingredient["name"])
      CookedMealIngredient.create! do |c|
        c.cooked_meal = m
        c.ingredient = ing
        c.amount = ingredient["size"]
      end
    end
  end
end
CateredMeal.create!(config["catered_meals"])
