Feature: search for a particular recipe
  As a Gracepoint Staff Member
  So that I can quickly look for the recipes that I want
  I want to search recipes by title

Background: 
  Given these recipes exist: "Lime Chicken, Chicken Tacos, Dabogee"

Scenario: search for a recipe
  Given I am on the browse recipes page
  When I search for "Chicken"
  Then I should see "Lime Chicken"
  And I should see "Chicken Tacos"
  And I should not see "Dabogee"
