Given /^the following recipes exist:?$/ do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:recipe, hash)
  end
end

Given /^these recipes exist: "([^"]*)"$/ do |recipes|
  recipes_list = recipes.split(',')
  recipes_list.each do |recipe_name|
    r = Recipe.create
    r[:name] = recipe_name
    r[:description] = "..."
    r[:ingredients] = "..."
    r[:directions] = "..."
    r[:time_in_minutes] = 5
    r[:servings] = 5
    r[:total_cost] = 5
    r.save
  end
end

Given /^the following users exist:$/ do |table|
  table.hashes.each do |hash|
    User.create!(hash)
  end
end

Given /^I am logged in as "(.*?)" with password "(.*?)"$/ do |user, password|
  visit '/users/sign_in'
  fill_in "Email", :with => user
  fill_in "Password", :with => password
  click_button "Sign in"
end

Given /^I add a recipe for "(.*?)"$/ do |recipe_name|
  visit '/recipes/new'
  fill_in "recipe_name", :with => recipe_name
  fill_in "recipe_description", :with => "..."
  fill_in "recipe_ingredients", :with => "..."
  fill_in "recipe_directions", :with => "..."
  fill_in "recipe_time_in_minutes", :with => 5
  fill_in "recipe_servings", :with => 5
  fill_in "recipe_total_cost", :with => 5
  click_button "Save Changes"
end

Given /^I search for a recipe named "(.*?)"$/ do |recipe_name|
  fill_in "Name contains", :with => "Lime Chicken"
  click_button "Search"
end
