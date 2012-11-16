Feature: add a cooking tip
    AS A experienced food manager
    I WANT to post new cooking tips
    SO THAT I can share my knowledge about cooking in general

Scenario: successfully adding a cooking tip
  Given I am logged in as an administrator
  And I am on the admin page
  When I follow "Posts"
  And I follow "New Post"
  And I fill in fields for cooking tip "How to fry eggs"
  And I press "Create Post"
  Then I should see "successfully created."
  When I follow "Posts"
  Then I should see "How to fry eggs"
