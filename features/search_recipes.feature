Feature: search for a particular recipe
  As a Gracepoitn Staff Member
  So that I can quickly look for the recipes that I want
  I want to search recipes by title

Background:
  
  Given the following recipes exist: 
    | name                    | servings | description                     | ingredients                       |
    | Dabogee                 | 30       | It's like a hoagie, but Korean. | Rice cake, fish cake, gochujang.  |
    | Lime Chicken Tacos      | 30       | Gideon's Favorite	             | Lime Chicken, Lettuce, Taco Shell |
    | Lime Chicken            | 5        | A Gideon Chia classic           | Some chicken, and a lot of limes. | 
    | Adobo                   | 8        | Filipino Favorite               | soy sauce, vinegar, pork, others  | 

  And I am on the home page

Scenario: search for a recipe
  Given I am on the browse recipes page
  When I fill in "Name contains" with "Lime Chicken"
  And I press "Search"
  Then I should see "Lime Chicken"
  And I should see "Lime Chicken Tacos"
  And I should not see "Adobo"