Feature: Merge Articles

As a site administrator
In order to be able to allow people to collaborate on posts with the same topic
I want to be able to merge two articles

Background:
Given the blog is set up 
And the following articles exist:
  | title     | author | body   | created_at          | published |
  | article 1 | admin  | text 1 | 2012-11-20 17:58:23 | true      |
  | article 2 | user   | text 2 | 2012-11-20 17:58:23 | true      |

Scenario: Admin sucessfully merges an article and sees the correct title
  Given I am logged into the admin panel
  And I am on the admin_content page
  When I follow "article 1"
  Then I should see "Merge"

Scenario: Non-admin tries to merge articles
  Given I am logged in as publisher
  And I am on the admin_content page
  When I follow "article 1"
  Then I should not see "Merge"

Scenario: When an admin merges, they see the article title as the title of one or the other
  Given I am an admin user
  And I merge article 1 with article 2
  Then I should see either the title of article A or the title of article B

Scenario: Admin successfully merges an article and sees the correct author
  When I am logged into the admin panel
  Then I should see either the author of article A or the author of article B

Scenario: Admin sees the comments of previous articles
  When I am logged into the admin panel
  Then I should see the comments of Article A
  And I should see the comments of Article B

Scenario: Admin sees the correct field
  Then there is a form field set to merge_with

