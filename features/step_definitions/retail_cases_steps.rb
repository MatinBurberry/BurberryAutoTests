And(/^I should create Retail Case$/) do
  on(HomePage).select_tab 'Retail Vendors'
  on(RetailCasesPage).create_retail_vendor
  on(HomePage).select_tab 'Cases'
  on(RetailCasesPage).create_retail_case 'Created'
end


Then(/^I should be able to find it by number$/) do
  case_number = on(RetailCasesPage).get_case_number
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'RETAIL CASES'
  on(RetailCasesBurberry20Page).find_case_by_number case_number
end

Then(/^I should be able to find it by vendor$/) do
  case_number = on(RetailCasesPage).get_case_number
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'RETAIL CASES'
  on(RetailCasesBurberry20Page).find_case_by_vendor(case_number, $RETAIL_VENDOR)
end

Then(/^I should be able to find it by status$/) do
  case_number = on(RetailCasesPage).get_case_number
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'RETAIL CASES'
  on(RetailCasesBurberry20Page).find_case_by_status(case_number, $RETAIL_VENDOR, 'Created')
end

Then(/^I should be able to change case status$/) do
  case_number = on(RetailCasesPage).get_case_number
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'RETAIL CASES'
  on(RetailCasesBurberry20Page).change_case_status case_number
  on(RetailCasesBurberry20Page).find_case_by_status(case_number, $RETAIL_VENDOR, 'Closed')
end