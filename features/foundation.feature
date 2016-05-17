Feature: Foundation feature in Burberry World 2.0

  Background:
    Given I login to Salesforce

  @foundation @volunteer_organization @volunteer_activity
  Scenario: SFDC-811 Create Volunteer Activity in Foundation
    Then I should be able to see Volunteer Activity

  @foundation @volunteer_organization @volunteer_activity
  Scenario: SFDC-812 Ask question for Volunteer Activity
    And I should be able to see Volunteer Activity
    Then I should be able to ask question

  @foundation @volunteer_organization @volunteer_activity
  Scenario: SFDC-813 Sign up for Volunteer Activity
    And I should be able to see Volunteer Activity
    Then I should be able to sign up