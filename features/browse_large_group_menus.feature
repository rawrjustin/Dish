Feature: display list of large group menus
  As a food manager
  So that I can reuse preexisting large group menus to save time & effort
  I want to browse the large group menus

Background:
  Given these menus exist: "Asian Meatballs, Vietnamese Sandwiches"

Scenario: show all menus
  Given I am on the large group menus page
  Then I should see "Asian Meatballs"
  And I should see "Vietnamese Sandwiches"
