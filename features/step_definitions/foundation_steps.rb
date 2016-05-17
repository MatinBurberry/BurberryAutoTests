Then(/^I should be able to see Volunteer Activity$/) do
  on(HomePage).select_tab 'Volunteer Organizations'
  on(VolunteerPage).create_volunteer_organization
  on(HomePage).select_tab 'Volunteer Activities'
  on(VolunteerPage).create_volunteer_activity
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'Foundation'
  on(FoundationBurberry20Page).get_volunteer_activity_name($VOLUNTEER_ACTIVITY).should eql $VOLUNTEER_ACTIVITY
end

Then(/^I should be able to sign up$/) do
  on(FoundationBurberry20Page).sign_up_for_activity($VOLUNTEER_ACTIVITY).should be true
end

Then(/^I should be able to ask question$/) do
  on(LoginPage).logout_from_system
  on(LoginPage).login_to_system(FigNewton.test_username_2, FigNewton.test_password_2)
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'Foundation'
  on(FoundationBurberry20Page).ask_question $VOLUNTEER_ACTIVITY
  on(LoginPage).logout_from_system
  on(LoginPage).login_to_system
  on(HomePage).select_app 'Burberry World 2.0'
  on(FoundationBurberry20Page).read_question($VOLUNTEER_ACTIVITY).should be true
end