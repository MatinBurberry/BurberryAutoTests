Feature: Groups feature in Burberry World 2.0

  Background:
    Given I login to Salesforce

  @groups @group
  Scenario: SFDC-806 Create public group in Burberry World 2.0
    And I create public group
    Then I should see group in Public groups list

  @groups @group
  Scenario: SFDC-807 Create private group in Burberry World 2.0
    And I create private group
    Then User should not see group in Public groups list

  @groups @group
  Scenario: SFDC-808 Accept request to join private group in Burberry World 2.0
    And Other user should be able to join private group
    Then I should be able to accept

  @groups @group
  Scenario: SFDC-809 Ignore request to join private group in Burberry World 2.0
    And Other user should be able to join private group
    Then I should be able ignore user

  @groups @group
  Scenario: SFDC-810 Manager is able to invite to private group in Burberry World 2.0
    And I can make user a group manager
    Then As a manager I can invite other users to group




