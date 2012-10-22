Feature: search for a particular recipe
  As a Gracepoitn Staff Member
  So that I can quickly look for the recipes that I want
  I want to search recipes by title

Background:
  Given these recipes exist: "Lime Chicken, Lime Chicken Tacos, Adobo"
  And I am on the browse recipes page

Scenario: search for a recipe
  When I search for a recipe named "Lime Chicken"
  Then I should see "Lime Chicken"
  And I should see "Lime Chicken Tacos"
  And I should not see "Adobo"
