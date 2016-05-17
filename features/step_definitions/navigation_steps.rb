Then(/^I should be able to see Dashboard content$/) do
  on(Burberry20Page).select_left_link_containing 'Dashboard'
  on(NavigationBurberry20Page).verify_dashboard_page.should be true
end

Then(/^I should be able to see Groups content$/) do
  on(Burberry20Page).select_left_link_containing 'Groups'
  on(NavigationBurberry20Page).verify_groups_page.should be true
end

Then(/^I should be able to see Knowledge content$/) do
  on(Burberry20Page).select_left_link_containing 'KNOWLEDGE'
  on(NavigationBurberry20Page).verify_knowledge_page.should be true
end

Then(/^I should be able to see News content$/) do
  on(Burberry20Page).select_left_link_containing 'News'
  on(NavigationBurberry20Page).verify_news_page.should be true
end

Then(/^I should be able to see Foundation content$/) do
  on(Burberry20Page).select_left_link_containing 'Foundation'
  on(NavigationBurberry20Page).verify_foundation_page.should be true
end