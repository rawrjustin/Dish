Given /^these recipes exist: "([^"]*)"$/ do |recipes|
  recipes_list = recipes.split(',')
  recipes_list.each do |recipe_name|
    r = Recipe.create
    r[:name] = recipe_name
    r.save
  end
end
