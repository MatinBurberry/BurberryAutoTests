Feature: Retail Cases feature in Burberry World 2.0

  Background:
    Given I login to Salesforce

  @retail_cases @retail_vendor @retail_case
  Scenario: SFDC-985 Find Retail Case by number
    And I should create Retail Case
    Then I should be able to find it by number

  @retail_cases @retail_vendor @retail_case
  Scenario: SFDC-986 Find Retail Case by vendor
    And I should create Retail Case
    Then I should be able to find it by vendor

  @retail_cases @retail_vendor @retail_case
  Scenario: SFDC-987 Find Retail Case by status
    And I should create Retail Case
    Then I should be able to find it by status

  @retail_cases @retail_vendor @retail_case
  Scenario: SFDC-988 Change Retail Case status
    And I should create Retail Case
    Then I should be able to change case status