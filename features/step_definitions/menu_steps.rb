Given /^the following menus exist:?$/ do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:menu, hash)
  end
end

Given /^these meals exist: "([^"]*)"$/ do |meals|
  meals_list = meals.split(',')
  meals_list.each do |meal_name|
    m = Meal.create
    m[:name] = meal_name
    m[:description] = "..."
    m[:phone] = "0123456789"
    m[:address] = "..."
    m[:ingredients] = "..."
    m[:servings] = 100
    m[:directions] = "..."
    m[:time_in_minutes] = 5
    m[:total_cost] = 5
    m.save!
  end
end
