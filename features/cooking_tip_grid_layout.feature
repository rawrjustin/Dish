Feature: display cooking tips with grid layout

Background:
  Given these cooking tips exist: "How to bake, How to deep fry"

Scenario: checking that the grid layout exists
  Given I am on the cooking tips page
  Then I should see "How to bake"
  Then I should see "How to deep fry"
  Then there are 2 grid elements
