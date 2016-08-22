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

  @tools @cvm
  Scenario: SFDC-XXX Verify Customer assignment
    And I create Customer
    Then Customer should be assigned to SA

  @tools @cvm
  Scenario: SFDC-XXX Verify Customer information
    And I create Customer
    Then Customer information is correct

  @tools @cvm
  Scenario: SFDC-XXX Reassign Customer
    And I create Customer
    Then I should be able to reassign

  @tools @cvm
  Scenario: SFDC-XXX Verify reassignment history
    And I create Customer
    Then I should be able to verify reassignment history

  @tools
  Scenario: SFDC-XXX Verify no selected customer message
    Then I should be able to see no selected customer message

  @tools @cvm
  Scenario: SFDC-XXX Verify reassignment message
    And I create Customer
    Then I should be able to verify reassignment message

  @tools @cvm
  Scenario: SFDC-XXX Verify customers count after reassignment
    And I create Customer
    Then I should be able to verify customers count after reassignment

  @tools @cvm
  Scenario: SFDC-XXX Verify customer filters
    And I create Customer
    Then I should be able to verify customer filters

  @tools @cvm
  Scenario: SFDC-XXX Verify customer search
    And I create Customer
    Then I should be able to verify customer search

