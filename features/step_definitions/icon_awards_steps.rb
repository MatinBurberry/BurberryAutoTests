And(/^I create Icon Awards nomination with category$/) do
  #on(HomePage).select_app 'Icon Awards'
  on(HomePage).select_tab 'FAQ Sets'
  on(IconAwardsPage).create_faq_set
  on(HomePage).select_tab 'Award Cycles'
  on(IconAwardsPage).make_award_cycles_inactive_and_not_archived
  on(HomePage).select_tab 'Award Cycles'
  on(IconAwardsPage).create_award_cycle
  on(IconAwardsPage).create_award_category
end

And(/^I create Icon Awards nomination$/) do
  on(HomePage).select_tab 'FAQ Sets'
  on(IconAwardsPage).create_faq_set
  on(HomePage).select_tab 'Award Cycles'
  on(IconAwardsPage).create_award_cycle
end

Then(/^I should be able to nominate$/) do
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'Icon Awards'
  on(Burberry20Page).select_left_link_containing 'Icon Awards 2016'
  on(IconAwardsBurberry20Page).nominate_no_post($AWARD_CATEGORY, $USER_2)
end

Then(/^I should be able to post nomination message$/) do
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'Icon Awards'
  on(Burberry20Page).select_left_link_containing 'Icon Awards 2016'
  on(IconAwardsBurberry20Page).nominate_and_post($AWARD_CATEGORY, $USER_2)
  on(Burberry20Page).select_left_link_containing 'Dashboard'
  on(DashboardBurberry20Page).select_dashboard_filter 'My Chat'
  on(DashboardBurberry20Page).verify_icon_post.should be true
end

Then(/^I should not be able to nominate using description less than (\d+) characters$/) do |arg1|
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'Icon Awards'
  on(Burberry20Page).select_left_link_containing 'Icon Awards 2016'
  on(IconAwardsBurberry20Page).nominate_check_description($AWARD_CATEGORY, $USER_2).should eql 'Characters: 49'
end

Then(/^I should be able to see dashboard in Burberry World 2.0$/) do
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'Dashboard'
  on(IconAwardsBurberry20Page).get_icon_awards_widget_name.should eql 'Icon Awards 2016'.upcase
end

Then(/^I should announce finalists and verify in Burberry World 2.0$/) do
  on(HomePage).go_to_salesforce
  on(HomePage).find_item($AWARD_CYCLE, 'Award Cycles')
  on(IconAwardsPage).create_award_region_finalists 'EMEIA'
  on(HomePage).find_item($AWARD_CATEGORY, 'Award Categories')
  on(IconAwardsPage).announce_finalist $USER_2
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'Icon Awards'
  on(Burberry20Page).select_left_link_containing 'Finalists'
  on(IconAwardsBurberry20Page).get_finalist_name($USER_2).should eql $USER_2.upcase
end

Then(/^I should announce winners and verify in Burberry World 2.0$/) do
  on(HomePage).go_to_salesforce
  on(HomePage).find_item($AWARD_CYCLE, 'Award Cycles')
  on(IconAwardsPage).edit_award_region_winners 'EMEIA'
  on(HomePage).find_item($AWARD_CATEGORY, 'Award Categories')
  on(IconAwardsPage).announce_winner $USER_2
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'Icon Awards'
  on(Burberry20Page).select_left_link_containing 'Winners'
  on(IconAwardsBurberry20Page).get_winner_name($AWARD_CATEGORY, $USER_2).should eql $USER_2.upcase
end

And(/^I complete full Icon Awards cycle$/) do
  on(HomePage).select_tab 'FAQ Sets'
  on(IconAwardsPage).create_faq_set
  on(HomePage).select_tab 'Award Cycles'
  on(IconAwardsPage).make_award_cycles_inactive_and_not_archived
  on(HomePage).select_tab 'Award Cycles'
  on(IconAwardsPage).create_award_cycle
  on(IconAwardsPage).create_award_category
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'Icon Awards'
  on(Burberry20Page).select_left_link_containing 'Icon Awards 2016'
  on(IconAwardsBurberry20Page).nominate_no_post($AWARD_CATEGORY, $USER_2)
  on(HomePage).go_to_salesforce
  on(HomePage).find_item($AWARD_CYCLE, 'Award Cycles')
  on(IconAwardsPage).create_award_region_finalists 'EMEIA'
  on(HomePage).find_item($AWARD_CATEGORY, 'Award Categories')
  on(IconAwardsPage).announce_finalist $USER_2
  on(HomePage).find_item($AWARD_CYCLE, 'Award Cycles')
  on(IconAwardsPage).edit_award_region_winners 'EMEIA'
  on(HomePage).find_item($AWARD_CATEGORY, 'Award Categories')
  on(IconAwardsPage).announce_winner $USER_2
end

Then(/^I verify winner image$/) do
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'Icon Awards'
  on(Burberry20Page).select_left_link_containing 'Winners'
  on(IconAwardsBurberry20Page).verify_winner_image($AWARD_CATEGORY).should be true
end

Then(/^I archive Icon Awards and verify in Burberry World 2.0$/) do
  on(IconAwardsPage).archive_cycle($AWARD_CYCLE)
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'Icon Awards'
  on(Burberry20Page).select_left_link_containing 'Archive'
  on(IconAwardsBurberry20Page).verify_archive($AWARD_CATEGORY, $USER_2).should be true
end

Then(/^I should be able to see FAQ$/) do
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'Icon Awards'
  on(Burberry20Page).select_left_link_containing $AWARD_FAQ_SET
  on(IconAwardsBurberry20Page).verify_FAQ.should be true
end

Then(/^Open Page "([^"]*)" and delete items "([^"]*)"$/) do |page, nameContains|
  on(AbstractPage).deleteItems(page, nameContains)
end
