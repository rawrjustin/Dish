Feature: add a large group menu to the recipe database
    AS A manager of the website
    I WANT to add a recipe to the food preparation database
    SO THAT I can share recipes for all the food managers to use

Background: create existing users
  Given the following users exist:
  | name       | email           | password|
  | billyjean  | bj@example.com  | billy123|
  | chrisbrown | cb@example.com  | chris123|

Scenario: guest cannot add a recipe
  Given I am not logged in
  And I am on the add a large group menu page
  Then I should be on the admin sign in page

Scenario: normal user cannot add a recipe
  Given I am logged in as a normal user
  And I am on the add a large group menu page
  Then I should be on the admin sign in page 

Scenario: admin can add a recipe
  Given I am logged in as an administrator
  And I am on the admin page
  Given I press "New Menu"
  Then I should be on the add a large group menu page
  When I press "New Menu"
  And I fill in the "title" field with "BBQ Chicken"
  And I press "submit"
  Then I should be on the edit page for "BBQ Chicken"
