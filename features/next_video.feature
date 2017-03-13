Feature: View Next Video

  @javascript
  Scenario: User wants to see a new video
    Given I sucessfully logged in as a User
    And I am on the home page
    When I click on Next New Video
    Then I should see a new video on the screen
    And The previous video should be listed as viewed

  @javascript
  Scenario: User changes the genre
    Given I sucessfully logged in as a User
    And I am on the home page
    When I change the genre
    Then I should see a video on that category

  @javascript
  Scenario: New users has no viewed videos
    Given I sucessfully logged in as a User
    And I am on the home page
    Then I should see no videos on the Previously Viewed list
