Feature: search for a particular small group recipe 
  AS A food manager
  I WANT to search small group recipes by title
  SO THAT I can quickly look for the small group recipe that I want

Background:
  Given these small group recipes exist: "Quesadillas, Chicken Tacos, Lime Chicken, Pork Adobo"

Scenario: search for a small group recipe
  Given I am on the small group recipes page
  When I search for "Chicken"
  Then I should see "Chicken Tacos"
  And I should see "Lime Chicken"
  And I should not see "Quesadillas"
