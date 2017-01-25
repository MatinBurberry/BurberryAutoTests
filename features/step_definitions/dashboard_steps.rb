When(/^I login to Salesforce$/) do
  #visit(HomePage)
  on(LoginPage).login_to_system
  on(LoginPage).go_to_salesforce
end

Then /^I should see "([^\"]*)"$/ do |expected|
  on(HomePage).app_launcher_element.when_visible do
    on(HomePage).app_launcher.should eql expected
  end
end

Then(/^I should select app "([^"]*)"$/) do |app|
  on(HomePage).select_app app
end

Then(/^I should see Burberry logo$/) do
  on(Burberry20Page).burberry_logo_element.when_visible do
    on(Burberry20Page).burberry_logo.should exist
  end
end

And(/^I can create a post$/) do
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'Dashboard'
  on(DashboardBurberry20Page).create_a_post $POST
end

Then(/^I should be able to see the post$/) do
  on(Burberry20Page).select_left_link_containing 'Dashboard'
  on(DashboardBurberry20Page).select_dashboard_filter 'All Chat'
  on(DashboardBurberry20Page).verify_post($POST).should be true
end

And(/^I can share a post$/) do
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'Dashboard'
  on(DashboardBurberry20Page).create_a_post $POST
  on(Burberry20Page).select_left_link_containing 'Dashboard'
  on(DashboardBurberry20Page).select_dashboard_filter 'All Chat'
  on(DashboardBurberry20Page).share_a_post $POST
end

Then(/^I should be able to see shared post$/) do
  on(DashboardBurberry20Page).verify_shared_post($POST).should be true
  on(Burberry20Page).select_left_link_containing 'Dashboard'
  on(DashboardBurberry20Page).select_dashboard_filter 'All Chat'
end