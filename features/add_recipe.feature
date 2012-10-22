Feature: add a recipe to the recipe database
    AS A Gracepoint Church staff member
    I WANT to add a recipe to the food preparation database
    SO THAT I can share recipes for all the food managers to use

Background: create a user
    Given an account exists for "billyjean@bro.com"
    And I am logged in as "billyjean@bro.com"

Scenario: successfully adding a recipe
    When I add a recipe for "Kimchi Fried Rice"
    Then I should be on the details page for "Kimchi Fried Rice"
