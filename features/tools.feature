Feature: Tools feature in Burberry World 2.0

  Background:
    Given I login to Salesforce

  @tools @corporate_gift
  Scenario: SFDC-989 Declare Gift Received
    Then I should be able to declare gift received

  @tools @corporate_gift
  Scenario: SFDC-990 Delete Pending Corporate Gift Declaration
    And I should be able to declare gift received
    Then I should be able to delete pending declaration

  @tools @corporate_gift
  Scenario: SFDC-991 Declare Gift Given
    Then I should be able to declare gift given

  @tools @corporate_gift
  Scenario: SFDC-992 Approve Gift Received
    And I should be able to declare gift received
    Then I should be able to approve gift received

  @tools @corporate_gift
  Scenario: SFDC-993 Approve Gift Given
    And I should be able to declare gift given
    Then I should be able to approve gift given