Feature: display list of recipes
  As a food manager
  So that I can save time and reuse preexisting recipes
  I want to browse the saved recipes

Background:
  
  Given the following recipes exist: 
  | name                    | servings | description | ingredients |
  | Dabogee                 | 30       | It's like a hoagie, but Korean. | Rice cake, fish cake, gochujang. |
  | Lime Chicken            | 5        | A Gideon Chia classic | Some chicken, and a lot of limes. | 

  And I am on the browse page 

Scenario: show all recipes
  Then I should see "Dabogee"
  And I should see "Lime Chicken"
