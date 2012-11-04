Given /^the following menus exist:?$/ do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:menu, hash)
  end
end

Given /^these menus exist: "([^"]*)"$/ do |menus|
  menus_list = menus.split(',')
  menus_list.each do |menu_name|
    m = Menu.create
    m[:name] = menu_name
    m[:description] = "..."
    m[:phone] = "0123456789"
    m[:address] = "..."
    m[:ingredients] = "..."
    m[:directions] = "..."
    m[:time_in_minutes] = 5
    m[:total_cost] = 5
    m.save
  end
end

