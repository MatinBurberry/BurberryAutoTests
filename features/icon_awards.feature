Feature: Icon Awards feature in Burberry World 2.0

  Background:
    Given I login to Salesforce

 @icon_awards @award_cycle @award_faq_set @award_category
  Scenario: SFDC-802 Icon Awards nominate user
    And I create Icon Awards nomination with category
    Then I should be able to nominate

  @icon_awards @award_cycle @award_faq_set @award_category @award_post
  Scenario: SFDC-820 Icon Awards share nomination post
    And I create Icon Awards nomination with category
    Then I should be able to post nomination message

  @icon_awards @award_cycle @award_faq_set @award_category
  Scenario: SFDC-803 Icon Awards check nomination description 50 characters long
    And I create Icon Awards nomination with category
    Then I should not be able to nominate using description less than 50 characters

  @icon_awards @award_cycle @award_faq_set
  Scenario: SFDC-804 Icon Awards check widget
    And I create Icon Awards nomination
    Then I should be able to see dashboard in Burberry World 2.0

  @icon_awards @award_cycle @award_faq_set @award_category
  Scenario: SFDC-805 Icon Awards Full cycle
    And I create Icon Awards nomination with category
    And I should be able to nominate
    Then I should announce finalists and verify in Burberry World 2.0
    Then I should announce winners and verify in Burberry World 2.0

  @icon_awards @award_cycle @award_faq_set @award_category
  Scenario: SFDC-823 Icon Awards Winner Image
    And I complete full Icon Awards cycle
    Then I verify winner image

  @icon_awards @award_cycle @award_faq_set @award_category
  Scenario: SFDC-825 Icon Awards Archive
    And I complete full Icon Awards cycle
    Then I archive Icon Awards and verify in Burberry World 2.0

  @icon_awards @award_cycle @award_faq_set @award_category
  Scenario: SFDC-845 Icon Awards verify FAQ Set
    And I create Icon Awards nomination with category
    Then I should be able to see FAQ

