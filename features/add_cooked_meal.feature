Feature: add a cooked meal recipe for large groups
    AS A large group food manager
    I WANT to add a home cooked recipe in the large group category
    SO THAT I can share recipes for all the food managers to use

Scenario: successfully adding a cooked meal recipe
  Given I am logged in as an administrator
  And I am on the admin page
  When I follow "Cooked Meals"
  And I follow "New Cooked Meal"
  And I fill in fields for cooked meal "Orange Chicken"
  And I press "Create Cooked meal"
  Then I should see "successfully created."
  When I am on the admin cooked meals page
  Then I should see "Orange Chicken"
