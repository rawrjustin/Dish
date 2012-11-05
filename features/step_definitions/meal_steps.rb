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
