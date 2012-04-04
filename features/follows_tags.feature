@javascript
Feature: Following Tags
  In order to take over humanity for the good of society
  As a rock star
  I want to see what humanity is saying about particular tags

  Background:
    Given a user with username "bob"
    And a user with username "alice"

    When I sign in as "bob@bob.bob"
    And I make a new school post "I am da #boss"
    And I wait for 5 seconds
    And I go to "/stream"
    Then "I am da #boss" should be post 1
    And show me the money
    When I go to the destroy user session page
    And I sign in as "alice@alice.alice"
    And I search for "#boss"
    And I wait for 10 seconds
    And I wait for the ajax to finish
    And show me the money
    And I press "Follow #boss"
    And I wait for the ajax to finish

  Scenario: can post a message from the tag page
    Then I should see "#boss" within "#publisher"
    And I post a status with the text "#boss from the tag page"
    And I search for "#boss"
    Then I should see "#boss from the tag page"

  Scenario: see a tag that I am following
    When I go to the home page
    And I follow "#boss"
    Then I should see "I am da #boss" within "body"

  Scenario: can stop following a tag from the tag page
    When I press "Following #boss"
    And I go to the followed tags stream page
    Then I should not see "#boss" within ".left_nav"

  Scenario: can stop following a tag from the homepage
    When I go to the followed tags stream page
    And I preemptively confirm the alert
    And I hover over the "li.unfollow#tag-following-boss"
    And I follow "unfollow_boss"
    And I wait for the ajax to finish
    Then I should not see "#tag-following-boss" within ".left_nav"
