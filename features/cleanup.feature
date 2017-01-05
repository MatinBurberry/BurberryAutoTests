Feature: Cleanup Feature

  Background:
    Given I login to Salesforce

  @cleanup
  Scenario: Items Cleanup Award Category
    Then Open Page "https://burberry--dev.cs14.my.salesforce.com/a3U?fcf=00BD0000008038e" and delete items "Auto Award"

  @cleanup
  Scenario: Items Cleanup Award Cycle
    Then Open Page "https://burberry--dev.cs14.my.salesforce.com/a3V?fcf=00BD0000008038f" and delete items "Auto Award"

  @cleanup
  Scenario: Items Cleanup Volunteer Activities
    Then Open Page "https://burberry--dev.cs14.my.salesforce.com/a1K?fcf=00BD0000007TuLu" and delete items "Auto Vol"

  @cleanup
  Scenario: Items Cleanup Volunteer Organizations
    Then Open Page "https://burberry--dev.cs14.my.salesforce.com/a1L?fcf=00BD0000007TuLv" and delete items "Auto Vol"

  @cleanup
  Scenario: Items Cleanup Customers
    Then Open Page "https://burberry--dev.cs14.my.salesforce.com/001?fcf=00Bc0000001Hnze&rolodexIndex=-1&page=1" and delete items "Doe"

  @cleanup
  Scenario: Items Cleanup News
    Then Open Page "https://burberry--dev.cs14.my.salesforce.com/a2C?fcf=00BD0000007UffA" and delete items "Auto News Title"

  Scenario: Cleanup
    Then Open My Groups and delete them