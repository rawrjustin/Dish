Feature: add a recipe to the recipe database

    AS A Gracepoint Church staff member
    I WANT to add a recipe to the food preparation database
    SO THAT I can share recipes for all the food managers to use

Background: create existing users
  Given the following users exist:
  | name       | email           | password|
  | billyjean  | bj@example.com  | billy123|
  | chrisbrown | cb@example.com  | chris123|

Scenario: successfully adding a recipe
  Given I am logged in as "billyjean" with password "billy123"
  And I am on the "add a recipe" page
  When I fill in "title" with "BBQ Chicken"
  And I fill in "description" with "It is perfect for casual group dinners. It is so tasty!"
  And I fill in "ingredients" with "1lb chicken, 1lb onions"
  And I fill in "directions" with "1. cut chicken, 2. grill it"
  And I fill in "time" with "30"
  And I fill in "servings" with "10"
  And I fill in "cost" with "50"
  And I press "submit"
  Then I should be on the details page for "BBQ Chicken"
  Then I should see "BBQ Chicken"
  Then I should see "It is perfect for casual group dinners. It is so tasty!"
  Given I am on the "browse recipes" page
  Then I should see "BBQ Chicken"
  And I should see "by billyjean"
