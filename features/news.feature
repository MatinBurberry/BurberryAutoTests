Feature: News feature in Burberry World 2.0

  Background:
    Given I login to Salesforce

  @news @news_story
  Scenario: SFDC-861 Publish public news story
    And I should publish public news story
    Then I should see public news story

  @news @news_story
  Scenario: SFDC-862 Publish public featured news story
    And I should publish public featured news story
    Then I should see public featured news story

  @news @news_story
  Scenario: SFDC-863 Publish public news story with Chat
    And I should publish public news story with Chat
    Then I should be able to chat

  @news @news_story
  Scenario: SFDC-864 Publish public news story with Tag
    And I should publish public news story
    Then I should see public news story with Tag

  @news @news_story
  Scenario: SFDC-865 Like public news story
    And I should publish public news story
    Then I should be able to like news story

  @news @news_story
  Scenario: SFDC-866 Like list for public news story
    And I should publish public news story
    Then I should be able to see likes list

  @news @news_story
  Scenario: SFDC-867 Follow public news story
    And I should publish public news story with Chat
    Then I should be able to see follow news story