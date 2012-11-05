Feature: View Caterer Information
  AS A large group food manager
  I WANT to to see the catering information of a particular restaurant with the address, phone, contact person, prices and servings
  SO THAT I can organize who I need to contact and what needs to be purchased

Background: View Catering Information
  Given these catered meals exist: "Peking Express"

Scenario: viewing the catering information
  Given I am on the details page for the large group meal "Peking Express"
  Then I should see "Peking Express"
