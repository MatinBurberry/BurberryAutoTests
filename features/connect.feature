Feature: Connect feature in Burberry World 2.0

  Background:
    Given I login to Salesforce

  @connect @hr_case
  Scenario: SFDC-XXX Raise A New Case with HR
    Then I should be able to raise a new case

  @connect @hr_case
  Scenario: SFDC-XXX Get case in progress status from HR
    And I should be able to raise a new case
    Then I get case in progress status from HR

