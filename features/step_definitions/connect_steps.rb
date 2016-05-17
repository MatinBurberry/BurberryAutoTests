Then(/^I should be able to raise a new case$/) do
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'CONNECT'
  on(Burberry20Page).select_left_link_containing 'ASK HR'
  case_number = on(ConnectBurberry20Page).raise_new_case('Talent Management', 'Online Training')
  on(HomePage).go_to_salesforce
  on(HomePage).find_and_delete_item(case_number, 'Ask HR Cases')
  end

