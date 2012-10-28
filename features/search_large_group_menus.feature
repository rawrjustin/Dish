Feature: search for a particular large group menu
  As a food manager
  So that I can quickly look for the large group menu that I want
  I want to search large group menus by title

Background: 
  Given these large group menus exist: "Asian Meatballs, Vietnamese Sandwiches, Ham & Cheese Sandwiches"

Scenario: search for a large group menu
  Given I am on the browse large group menus page
  When I search for "Sandwiches"
  And I should see "Vietnamese Sandwiches"
  And I should see "Ham & Cheese Sandwiches"
  And I should not see "Asian Meatballs"
