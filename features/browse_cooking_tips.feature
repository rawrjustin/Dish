Feature: display list of cooking tips
  AS A food manager
  I WANT to browse the cooking tips/posts
  SO THAT I can learn different styles of cooking and procedures

Background:
  Given these cooking tips exist: "How to bake, How to deep fry"

Scenario: show all cooking tips
  Given I am on the cooking tips page
  Then I should see "How to bake"
  And I should see "How to deep fry"
