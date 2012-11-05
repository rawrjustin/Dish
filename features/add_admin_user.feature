Feature: add admin user
    AS A food manager
    I WANT to create more admin user accounts
    SO THAT other food managers can also log in and add recipes

    Scenario: successfully adding an admin user
        Given I am logged in as an administrator
        And I am on the admin page
        When I follow "Admin Users"
        And I follow "New Admin User"
        And I fill in "Email" with "kobe@lakers.com"
        And I fill in "Password" with "secret"
        And I fill in "Password confirmation" with "secret"
        And I press "Create Admin user"
        Then I should see "successfully created."
        When I follow "Logout"
        And I fill in "Email" with "kobe@lakers.com"
        And I fill in "Password" with "secret"
        And I press "Login"
        Then I should see "Signed in"
