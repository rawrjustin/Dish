Feature: View Caterer Information
  AS A large group food manager
  I WANT to to see the catering information of a particular restaurant with the address, phone, contact person, prices and servings
  SO THAT I can organize who I need to contact and what needs to be purchased

  Background: View Catering Information
    Given the following caterers exists:
    | name	     | address				| phone	         |
    | Peking Express | 123 Main St. Berkeley, CA. 94704 | (123) 456-7890 |

  Scenario: viewing the catering information
    Given I am on the "Peking Express" catering info page
    Then I should see "Peking Express"
    Then I should see "123 Main St. Berkeley, CA. 94704"
    Then I should see "(123) 456-7890"
