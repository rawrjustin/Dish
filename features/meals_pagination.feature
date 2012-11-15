Feature: Paginate meals

Background:
  Given no meals exist
  And 100 meals exist

Scenario: verify page links
  Given I am on the large group meals page
  Then there are 4 pages
  And there are only links to later pages
  When I follow "3"
  Then there are links to both earlier and later pages
  When I follow "4"
  Then there are only links to earlier pages
