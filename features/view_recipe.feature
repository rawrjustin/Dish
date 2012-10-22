Feature: display a single recipe
    As A person in charge of food prep
    So that I know what ingredients I need and also how to make the recipe
    I want to see the details of a recipe

Background:
  
  Given the following recipes exist: 
  | name            | servings | description   | ingredients    | directions                          | total_cost | time_in_minutes |
  | Asian Meatballs | 100      | Awesome stuff | beef meatballs | 1 Preheat oven, 2 toss in meatballs | 150.00     | 95              |

Scenario: Viewing the Asian Meatballs recipe
  Given I am on the details page for "Asian Meatballs"
  Then I should see "Asian Meatballs"
  Then I should see "Preheat oven"
  Then I should see "Awesome stuff"
  Then I should see "beef meatballs"
  Then I should see "$1.50"
  Then I should see "100"
