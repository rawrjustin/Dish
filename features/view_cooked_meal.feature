Feature: display a single large group menu
    As A food manager
    So that I need to buy and what I need to do in order to prepare a meal for a large group
    I want to see the details of a large group menu

Background:
  Given these cooked meals exist: "Asian Meatballs"

Scenario: Viewing the Asian Meatballs large group meal
  Given I am on the details page for the large group meal "Asian Meatballs"
  Then I should see "Asian Meatballs"
