Feature: add an ingredient
    AS A food manager
    I WANT to add a ingredient
    SO THAT other food managers can add ingredients to their recipes

    Scenario: successfully adding an ingredient
        Given I am logged in as an administrator
        And I am on the admin page
        When I follow "Ingredients"
        And I follow "New Ingredient"
        And I fill in "Name" with "Cucumber"
        And I fill in "Price" with "3.50"
        And I fill in "Photo" with "blahblah"
        And I fill in "Notes" with "get the green ones not the brown ones"
        And I fill in "Location" with "Costco"
        And I press "Create Ingredient"
        Then I should see "successfully created."

        When I follow "Ingredients"
        Then I should see "Cucumber (Costco)"
