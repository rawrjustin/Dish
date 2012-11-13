Feature: Filter meals by cost
  As a food manager
  So that I can quickly find a meal meeting my budget
  I want to filter meals by cost

Background:
  Given these $2 meals exist: "Asian Meatballs, Vietnamese Sandwiches, Ham & Cheese Sandwiches"
  And these $5 meals exist: "Steak and Sushi, Teriyaki Chicken Burrito"
  And I am on the large group meals page

Scenario: no filters
  Then there are 5 meals

Scenario: $2 filter
  When I follow "Meals under $2"
  Then there are 3 meals
  And I should see "Asian Meatballs"
  And I should see "Vietnamese Sandwiches"
  And I should see "Ham & Cheese Sandwiches"

Scenario: $5 filter
  When I follow "Meals under $5"
  Then there are 2 meals
  #FIXME this is a wrong test, should include the under $2 as well right?
  And I should see "Steak and Sushi"
  And I should see "Teriyaki Chicken Burrito"
