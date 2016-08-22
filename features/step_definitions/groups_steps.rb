And(/^I create public group$/) do
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'Groups'
  on(GroupsBurberry20Page).create_group($GROUP, true)
end

Then(/^I should see group in Public groups list$/) do
  on(GroupsBurberry20Page).verify_group_exists($GROUP, 'My Groups', 'Public Groups', 'Recently Active').should be true
end


And(/^I create private group$/) do
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'Groups'
  on(GroupsBurberry20Page).create_group($GROUP, false)
end


Then(/^User should not see group in Public groups list$/) do
  on(GroupsBurberry20Page).verify_group_exists($GROUP, 'My Groups', 'Public Groups', 'Recently Active').should be false
end

Then(/^Other user should be able to join private group$/) do
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'Groups'
  on(GroupsBurberry20Page).create_group($GROUP, false)
  on(LoginPage).logout_from_system
  on(LoginPage).login_to_system(FigNewton.test_username_2, FigNewton.test_password_2)
  on(HomePage).select_app 'Burberry World 2.0'
  on(GroupsBurberry20Page).join_group $GROUP
  on(GroupsBurberry20Page).verify_user_joined_group($GROUP).should be true
  on(LoginPage).logout_from_system
end

Then(/^I should be able to accept$/) do
  on(LoginPage).login_to_system
  on(HomePage).select_app 'Burberry World 2.0'
  on(GroupsBurberry20Page).accept_join_to_group_request
  on(GroupsBurberry20Page).verify_user_accepted.should be true
end

Then(/^I should be able ignore user$/) do
  on(LoginPage).login_to_system
  on(HomePage).select_app 'Burberry World 2.0'
  on(GroupsBurberry20Page).ignore_join_to_group_request.should be false
end

Then(/^I can make user a group manager$/) do
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'Groups'
  on(GroupsBurberry20Page).create_group($GROUP, false)
  on(LoginPage).logout_from_system
  on(LoginPage).login_to_system(FigNewton.test_username_2, FigNewton.test_password_2)
  on(HomePage).select_app 'Burberry World 2.0'
  on(GroupsBurberry20Page).join_group $GROUP
  on(GroupsBurberry20Page).verify_user_joined_group($GROUP).should be true
  on(LoginPage).logout_from_system
  on(LoginPage).login_to_system
  on(HomePage).select_app 'Burberry World 2.0'
  on(GroupsBurberry20Page).accept_join_to_group_request
  on(GroupsBurberry20Page).make_user_a_manager
  on(GroupsBurberry20Page).verify_user_is_a_manager.should be true
end

Then(/^As a manager I can invite other users to group$/) do
  on(LoginPage).logout_from_system
  on(LoginPage).login_to_system(FigNewton.test_username_2, FigNewton.test_password_2)
  on(HomePage).select_app 'Burberry World 2.0'
  on(GroupsBurberry20Page).invite_user_to_group($GROUP, $USER_3).should be true
end

And(/^Open My Groups and delete them$/) do
  on(HomePage).select_app 'Burberry World 2.0'
  on(GroupsBurberry20Page).delete_all_groups("Auto group")
end