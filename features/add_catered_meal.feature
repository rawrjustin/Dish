Feature: add Caterer Information
    AS A large group food manager
    I WANT to record a catering service in the Bay Area
    SO THAT I can easily access their contact information for the next event

Scenario: successfully adding a cooked meal recipe
  Given I am logged in as an administrator
  And I am on the admin page
  When I follow "Catered Meals"
  And I follow "New Catered Meal"
  And I fill in fields for catered meal "Peking Express"
  And I press "Create Catered meal"
  Then I should see "successfully created."
  When I am on the admin catered meals page
  Then I should see "Peking Express"
