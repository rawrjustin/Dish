Feature: Select if I'm cooking for a small group or large group
  AS A food manager or cook
  I WANT to be able to select what type of group I am cooking for.
  SO THAT I can view the relevant recipes for me.

Background: 
  Given I am on the home page

Scenario: Select large group view
  When I follow "Large Group"
  Then I should be on the large group meals page

Scenario: Select small group view
  When I follow "Small Group"
  Then I should be on the small group recipes page

Scenario: Select Cooking Tip group view
  When I follow "Cooking Tips"
  Then I should be on the cooking tips page
