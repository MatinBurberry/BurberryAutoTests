Feature: Dashboard feature in Burberry World 2.0

  Background:
    Given I login to Salesforce

  @dashboard
  Scenario: Select app in Salesforce
    And I should select app "Burberry World 2.0"
    Then I should see Burberry logo

  @dashboard @1post
  Scenario: SFDC-814 Create a post and view it in Burberry World 2.0
    And I can create a post
    Then I should be able to see the post

  #@dashboard @2posts
  Scenario: SFDC-829 Share a post and view it in Burberry World 2.0
    And I can share a post
    Then I should be able to see shared post