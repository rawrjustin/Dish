Feature: add Caterer Information
    AS A large group food manager
    I WANT to record a catering service in the Bay Area
    SO THAT I can easily access their contact information for the next event

    Background: Admin wants to add Catering
        Given an account exists for "supremecommander@unitednations.org"
        And I am logged in as "supremecommander@unitednations.org"

    Scenario: successfully adding a caterer
        When I am on the add a caterer page
        Then show me the page
        When I fill in "catered_meal_name" with "Peking Express"
        When I fill in "catered_meal_address" with "2068 Center Street Berkeley, CA 94704"
        When I fill in "catered_meal_phone" with "(510) 841-5942"
        When I press "Create Catered meal"

        #Then I should be on the admin view page for "Peking Express"
        Then I should see "Peking Express was successfully created."
        And I should see "2068 Center Street Berkeley, CA 94704"
        And I should see "(510) 841-5942"

        # View the actual meal 
        When I am on the large group meals page
        Then I should see "Peking Express"

        When I follow "Peking Express"
        Then I should see "2068 Center Street Berkeley, CA 94704"
        And I should see "(510) 841-5942"
