Feature: Knowledge feature in Burberry World 2.0

  Background:
    Given I login to Salesforce

  @knowledge @policy
  Scenario: SFDC-834 Create policy and verify in Burberry World 2.0
    And I create "AskHR" policy
    Then I should be able to see in "Policies"

  @knowledge @policy
  Scenario: SFDC-815 Create policy for user to approve in Burberry World 2.0
    And I create "AskHR" policy which needs user approval
    Then I should be able to accept in "Policies"

  @knowledge @policy_1_2
  Scenario: SFDC-833 Verify policy image is displayed in Burberry World 2.0
    And I create "AskHR" knowledge categories 1 & 2
    Then I should be able to see image in "Policies"

  @knowledge @policy
  Scenario: SFDC-846 Create retail policy and verify in Burberry World 2.0
    And I create "Service and Productivity" policy
    Then I should be able to see in "Retail"

  @knowledge @policy
  Scenario: SFDC-847 Create retail policy for user to approve in Burberry World 2.0
    And I create "Service and Productivity" policy which needs user approval
    Then I should be able to accept in "Retail"

  @knowledge @policy_1_2
  Scenario: SFDC-848 Verify retail policy image is displayed in Burberry World 2.0
    And I create "Service and Productivity" knowledge categories 1 & 2
    Then I should be able to see image in "Retail"