Feature: display a single recipe
    AS A food manager
    I WANT to see the details of a small group recipe
    SO THAT I can plan what I need to do to cook a particular meal

Background:
  Given these small group recipes exist: "Quesadillas"

Scenario: Viewing the Quesadillas small group recipe
  Given I am on the details page for the small group recipe "Quesadillas"
  Then I should see "Quesadillas"
  And I should see "Tortilla"
  And I should see "Cheese"
  And I should see "10 minutes"
  And I should see "5 people"
  And I should see "$8"
