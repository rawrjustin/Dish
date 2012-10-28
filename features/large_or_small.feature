Feature: Select if I'm cooking for a small group or large group
  AS A food manager or cook
  I WANT to be able to select what type of group I am cooking for.
  SO THAT I can view the relevant recipes for me.

Background: 
  Given I am on the home page

Scenario: Select large group view
  When I press "Large Group"
  Then I should be on the large group menus page

Scenario: Select small group view
  When I press "Small Group"
  Then I should be on the small group recipes page
