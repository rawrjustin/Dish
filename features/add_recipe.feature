Feature: add recipe
    AS A food manager
    I WANT to add a recipe
    SO THAT staff members or students can use the recipe to cook for a small group or potluck

    Scenario: successfully adding a recipe
        Given I am logged in as an administrator
        And I am on the admin page
        When I follow "Recipes"
        And I follow "New Recipe"
        And I fill in "Name" with "Quesadillas"
        And I fill in "Description" with "Great midnight snack."
        And I fill in "Ingredients" with "Tortillas, meat, cheese, salsa, sour cream, guacamole."
        And I fill in "Directions" with "Cook meat, heat tortillas, put everything inside. Enjoy."
        And I fill in "Time in minutes" with "20"
        And I fill in "Servings" with "5"
        And I fill in "Total cost" with "10"
        And I press "Create Recipe"
        Then I should see "successfully created."
        
        When I follow "Recipes"
        Then I should see "Quesadillas"

