Feature: display a single cooking tip
    As A food manager
    So that I can read the whole article
    I want to see the full article of a certain cooking tip

Background:
  Given these cooking tips exist: "How to bake, How to deep fry"

Scenario: Viewing the Asian Meatballs large group meal
  Given I am on the cooking tips page
  When I follow "How to bake"
  Then I should see "How to bake"
  Then I should not see "How to deep fry"
