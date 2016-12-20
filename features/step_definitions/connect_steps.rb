
Then(/^I should be able to raise a new case$/) do
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'CONNECT'
  on(Burberry20Page).select_left_link_containing 'ASK HR'
  $HR_CASE_NUMBER = on(ConnectBurberry20Page).raise_new_case('Talent Management', 'Online Training')
end

Then(/^I get case in progress status from HR$/) do
  on(HomePage).go_to_salesforce
  on(ConnectPage).change_hr_case_status($HR_CASE_NUMBER, 'In Progress')
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'CONNECT'
  on(Burberry20Page).select_left_link_containing 'ASK HR'
  on(ConnectBurberry20Page).get_hr_case_status($HR_CASE_NUMBER).should eql 'In Progress'
end

