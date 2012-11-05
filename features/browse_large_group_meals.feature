Feature: display list of large group meals
  As a food manager
  So that I can reuse preexisting large group meals to save time & effort
  I want to browse the large group meals

Background:
  Given these meals exist: "Asian Meatballs, Vietnamese Sandwiches"

Scenario: show all meals
  Given I am on the large group meals page
  Then I should see "Asian Meatballs"
  And I should see "Vietnamese Sandwiches"
