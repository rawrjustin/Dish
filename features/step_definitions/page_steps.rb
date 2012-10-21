
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

Then /^(?:|I )should( not)? see "([^"]*)"$/ do |negate, text|
    negate ? page.should_not(have_content(text)) : page.should(have_content(text))
end

Then /^show me the page$/ do
  save_and_open_page
end
