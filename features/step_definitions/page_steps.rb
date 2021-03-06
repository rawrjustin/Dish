
Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end

When /^(?:|I )follow "([^"]*)"$/ do |link|
  click_link(link)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^I select "(.*)" from "(.*)"$/ do |value, field|
    select(value, :from => field) 
end

Then /^(?:|I )should( not)? see "([^"]*)"$/ do |negate, text|
    negate ? page.should_not(have_content(text)) : page.should(have_content(text))
end

Then /^(?:|I )should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end

Then /^show me the page$/ do
  save_and_open_page
end


Given /^an account exists for "(.*?)"$/ do |email|
  User.create({
    :email => email, 
    :password => "welcome"})
end

Given /^I am logged in as "(.*?)"$/ do |email|
  visit '/users/sign_in'
  fill_in "Email", :with => email
  fill_in "Password", :with => "welcome"
  click_button "Sign in"
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
