Given /^I am logged in as an administrator$/ do
  visit '/admin/login'
  fill_in "Email", :with => "admin@example.com"
  fill_in "Password", :with => "password"
  click_button "Login"
end

When /^I fill in fields for cooked meal "(.*?)"$/ do |name|
  fill_in "Name", :with => name
  fill_in "Description", :with => "Delicious!"
  fill_in "Ingredients", :with => "Onions and meat"
  fill_in "Directions", :with => "Cook it"
  fill_in "Time in minutes", :with => 30
  fill_in "Servings", :with => 200
end

When /^I fill in fields for catered meal "(.*?)"$/ do |name|
  fill_in "Name", :with => name
  fill_in "Description", :with => "Delicious!"
  fill_in "Phone", :with => "315-000-PEKI"
  fill_in "Address", :with => "2222 Telegraphy Ave."
  fill_in "Servings", :with => 200
end

Given /^the following meals exist:?$/ do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:meal, hash)
  end
end

Given /^these catered meals exist: "([^"]*)"$/ do |meals|
  meals_list = meals.split(',')
  meals_list.each do |meal_name|
    m = CateredMeal.create
    m[:name] = meal_name
    m[:description] = "..."
    m[:phone] = "0123456789"
    m[:address] = "..."
    m[:servings] = 100
    m.save!
  end
end

Given /^these cooked meals exist: "([^"]*)"$/ do |meals|
  meals_list = meals.split(',')
  meals_list.each do |meal_name|
    m = CookedMeal.create
    m[:name] = meal_name
    m[:description] = "..."
    m[:ingredients] = "..."
    m[:directions] = "..."
    m[:time_in_minutes] = 100
    m[:servings] = 100
    m.save!
  end
end

Given /^I search for "(.*?)"$/ do |meal_name|
  fill_in "Name contains", :with => meal_name
  click_button "Search"
end
