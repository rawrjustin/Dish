Feature: display a single large group menu
    As A food manager
    So that I need to buy and what I need to do in order to prepare a meal for a large group
    I want to see the details of a large group menu

Background:
  Given the following recipes exist: 
  | name            | servings | description   | ingredients    | directions                          | total_cost | time_in_minutes |
  | Asian Meatballs | 100      | Awesome stuff | beef meatballs | 1 Preheat oven, 2 toss in meatballs | 150.00     | 95              |

Scenario: Viewing the Asian Meatballs large group menu
  Given I am on the "Asian Meatballs" large group menu page
  Then I should see "Asian Meatballs"
  Then I should see "Preheat oven"
  Then I should see "Can't have enough of it"
  Then I should see "rice"
  Then I should see "$1.50 per person"
