Feature: add Caterer Information
    AS A large group food manager
    I WANT to record a catering service in the Bay Area
    SO THAT I can easily access their contact information for the next event

    Background: Admin wants to add Catering
        Given an account exists for "supremecommander@unitednations.org"
        And I am logged in as "supremecommander@unitednations.org"

    Scenario: successfully adding a caterer
        When I am on the add a caterer page
        When I fill in "name" with "Peking Express"
        When I fill in "address" with "2068 Center Street Berkeley, CA 94704"
        When I fill in "phone" with "(510) 841-5942"
        When I press "save"
        # probably have a flash 
        Then I should see "Peking Express saved"
