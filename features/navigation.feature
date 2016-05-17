Feature: Navigation feature in Burberry World 2.0

  Background:
    Given I login to Salesforce
    Given I should select app "Burberry World 2.0"

  @navigation
  Scenario: SFDC-XXX Dashboard
    Then I should be able to see Dashboard content

  @navigation
  Scenario: SFDC-XXX Groups
    Then I should be able to see Groups content

  @navigation
  Scenario: SFDC-XXX Knowledge
    Then I should be able to see Knowledge content

  @navigation
  Scenario: SFDC-XXX News
    Then I should be able to see News content

  @navigation
  Scenario: SFDC-XXX Foundation
    Then I should be able to see Foundation content
