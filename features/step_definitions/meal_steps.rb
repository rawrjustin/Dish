Given /^I am logged in as an administrator$/ do
  visit '/admin/login'
  fill_in "Email", :with => "admin@example.com"
  fill_in "Password", :with => "password"
  click_button "Login"
end

When /^I fill in fields for cooked meal "(.*?)"$/ do |name|
  fill_in "Name", :with => name
  fill_in "Image URL", :with => "some_link"
  fill_in "Description", :with => "Delicious!"
  fill_in "Ingredients", :with => "Onions and meat"
  fill_in "Directions", :with => "Cook it"
  fill_in "Time in minutes", :with => 30
  fill_in "Servings", :with => 200
end

When /^I fill in fields for catered meal "(.*?)"$/ do |name|
  fill_in "Name", :with => name
  fill_in "Image URL", :with => "some_link"
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
  meals_list = meals.split(/,\s*/)
  meals_list.each do |meal_name|
    m = CateredMeal.create
    m[:name] = meal_name
    m[:thumb] = "some_link"
    m[:description] = "..."
    m[:phone] = "0123456789"
    m[:address] = "..."
    m[:servings] = 100
    m[:cost] = "Under $5"
    m.save!
  end
end

Given /^no meals exist$/ do
  Meal.delete_all
end

Given /^these cooked meals exist: "([^"]*)"$/ do |meals|
  meals_list = meals.split(/,\s*/)
  meals_list.each do |meal_name|
    m = CookedMeal.create
    m[:name] = meal_name
    m[:thumb] = "some_link"
    m[:description] = "..."
    m[:ingredients] = "..."
    m[:directions] = "..."
    m[:time_in_minutes] = 100
    m[:servings] = 100
    m[:cost] = "Under $2"
    m.save!
  end
end

Given /^I search for "(.*?)"$/ do |meal_name|
  fill_in "q_name_cont", :with => meal_name
  click_button "Search"
end

Given /^these \$(\d+) meals exist: "(.*?)"$/ do |amount, meals|
  meals_list = meals.split(/,\s*/)
  meals_list.each do |meal_name|
    m = CookedMeal.create
    m[:name] = meal_name
    m[:thumb] = "some_link"
    m[:description] = "..."
    m[:ingredients] = "..."
    m[:directions] = "..."
    m[:time_in_minutes] = 100
    m[:servings] = 100
    m[:cost] = "Under $#{amount}"
    m.save!
  end
end

Then /^there are (\d+) meals$/ do |count|
  count = count.to_i
  thumbnails = page.all('div .mealname')
  thumbnails.length.should == count
end

Given /^(\d+) meals exist$/ do |num|
  (1..num.to_i).each do
    step %{these cooked meals exist: "Asian Meatballs"}
  end
end

Then /^there are (\d+) pages$/ do |num|
  pages = page.all('div .pagination')
  pages[0].all('li').length.should == num.to_i + 2
end

Then /^there are only links to later pages$/ do
  step %{I should see "Next"}
  step %{I should see "Last"}
  step %{I should not see "Prev"}
  step %{I should not see "First"}
end

Then /^there are only links to earlier pages$/ do
  step %{I should see "Prev"}
  step %{I should see "First"}
  step %{I should not see "Next"}
  step %{I should not see "Last"}
end

Then /^there are links to both earlier and later pages$/ do
  step %{I should see "Prev"}
  step %{I should see "First"}
  step %{I should see "Next"}
  step %{I should see "Last"}
end
