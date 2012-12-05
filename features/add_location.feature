Feature: add a location
    AS A food manager
    I WANT to add a location
    SO THAT other food managers can add a location to the ingredients

    Scenario: successfully adding a location
        Given I am logged in as an administrator
        And I am on the admin page
        When I follow "Locations"
        And I follow "New Location"
        And I fill in "Name" with "Costco"
        And I fill in "City" with "San Leandro"
        And I fill in "Address" with "5555 Swift Street"
        And I press "Create Location"
        Then I should see "successfully created."

        When I am on the admin locations page
        Then I should see "Costco"
        Then I should see "San Leandro"
