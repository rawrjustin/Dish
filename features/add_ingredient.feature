Feature: add an ingredient
    AS A food manager
    I WANT to add a ingredient
    SO THAT other food managers can add ingredients to their recipes

    Scenario: successfully adding an ingredient
        Given I am logged in as an administrator
        And I am on the admin page
        When I follow "Locations"
        And I follow "New Location"
        And I fill in "Name" with "Costco"
        And I fill in "City" with "San Leandro"
        And I fill in "Address" with "5555 Swift Street"
        And I press "Create Location"

        When I am on the admin ingredients page
        And I follow "New Ingredient"
        And I fill in "Name" with "Cucumber"
        And I fill in "Price" with "3.50"
        And I fill in "Photo" with "blahblah"
        And I fill in "Notes" with "get the green ones not the brown ones"
        And I select "Costco (San Leandro)" from "Location"
        And I press "Create Ingredient"
        Then I should see "successfully created."

        When I am on the admin ingredients page
        Then I should see "Cucumber"
        Then I should see "Costco (San Leandro)"
