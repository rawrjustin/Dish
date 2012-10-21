Feature: display list of recipes
  As a food manager
  So that I can save time and reuse preexisting recipes
  I want to browse the recipes

Background:
  Given these recipes exist: "McNuggets, Dabogee"

Scenario: show all recipes
  Given I am on the browse recipes page
  Then I should see "McNuggets"
  And I should see "Dabogee"
