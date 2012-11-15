Feature: display list of small group recipes
  AS A food manager
  I WANT to browse the small group recipes
  SO THAT I can reuse preexisting small group recipes to save time & effort

Background:
  Given these small group recipes exist: "Quesadillas, Chicken Adobo"

Scenario: show all meals
  Given I am on the small group recipes page
  Then I should see "Quesadillas"
  And I should see "Chicken Adobo"
