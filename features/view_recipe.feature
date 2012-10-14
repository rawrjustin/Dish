Feature: display a single recipe
    As A person in charge of food prep
    So that I know what ingredients I need and also how to make the recipe
    I want to see the details of a recipe

Background:
  
  Given the following recipes exist: 
  | name            | servings | description             | ingredients                             | direction                                       | cpp   |
  | Asian Meatballs | 100      | Can't have enough of it | beef meatballs (60 lbs), rice (10 cups) | 1 Preheat oven, 2 toss in meatballs, 3 add rice | $1.50 |

Scenario: Viewing the Asian Meatballs recipe
  Given I am on the "Asian Meatballs" recipe page
  Then I should see "Asian Meatballs"
  Then I should see "Preheat oven"
  Then I should see "Can't have enough of it"
  Then I should see "rice"
  Then I should see "$1.50 per person"
  Then I should see "200 servings"
  Then I should see "Scale Ingredients"
