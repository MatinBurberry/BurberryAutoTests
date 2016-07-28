Then(/^I should be able to declare gift received$/) do
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'Tools'
  on(Burberry20Page).select_left_link_containing 'Gifts & Hospitality'
  on(ToolsBurberry20Page).declare_gift ('Offered / Received')
  on(Burberry20Page).select_left_link_containing 'Gifts & Hospitality'
  on(ToolsBurberry20Page).verify_gift_received.should be true
end

Then(/^I should be able to delete pending declaration$/) do
  on(Burberry20Page).select_left_link_containing 'Gifts & Hospitality'
  on(ToolsBurberry20Page).delete_declaration $GIFT_DESC
end

Then(/^I should be able to declare gift given$/) do
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'Tools'
  on(Burberry20Page).select_left_link_containing 'Gifts & Hospitality'
  on(ToolsBurberry20Page).declare_gift ('Given')
  on(Burberry20Page).select_left_link_containing 'Gifts & Hospitality'
  on(ToolsBurberry20Page).verify_gift_received.should be true
end

Then(/^I should be able to approve gift received$/) do
  on(HomePage).go_to_salesforce
  on(ToolsPage).approve_corporate_gift_received $GIFT_DESC
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'Tools'
  on(Burberry20Page).select_left_link_containing 'Gifts & Hospitality'
  on(ToolsBurberry20Page).verify_gift_status('APPROVED').should be true
end

Then(/^I should be able to approve gift given$/) do
  on(HomePage).go_to_salesforce
  on(ToolsPage).approve_corporate_gift_given $GIFT_DESC
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'Tools'
  on(Burberry20Page).select_left_link_containing 'Gifts & Hospitality'
  on(ToolsBurberry20Page).verify_gift_status('APPROVED').should be true
end

And(/^I create Customer$/) do
  on(HomePage).select_tab 'Customers/Contacts'
  on(CustomersContactsPage).create_customer
  on(CustomersContactsPage).create_cvm_info
end

And(/^Customer should be assigned to SA$/) do
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'Tools'
  on(Burberry20Page).select_left_link_containing 'CVM Reassignment'
  on(CVMBurberry20Page).verify_customer_assignment($USER_1, $CUSTOMER_FIRST + ' ' + $CUSTOMER_LAST).should be true
end

And(/^Customer information is correct$/) do
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'Tools'
  on(Burberry20Page).select_left_link_containing 'CVM Reassignment'
  on(CVMBurberry20Page).verify_customer_assignment($USER_1, $CUSTOMER_FIRST + ' ' + $CUSTOMER_LAST).should be true
end

And(/^I should be able to reassign$/) do
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'Tools'
  on(Burberry20Page).select_left_link_containing 'CVM Reassignment'
  on(CVMBurberry20Page).reassign_customer($USER_1, $USER_2, $CUSTOMER_FIRST + ' ' + $CUSTOMER_LAST)
  on(CVMBurberry20Page).verify_customer_assignment($USER_2, $CUSTOMER_FIRST + ' ' + $CUSTOMER_LAST).should be true
end

And(/^I should be able to verify reassignment history$/) do
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'Tools'
  on(Burberry20Page).select_left_link_containing 'CVM Reassignment'
  on(CVMBurberry20Page).reassign_customer($USER_1, $USER_2, $CUSTOMER_FIRST + ' ' + $CUSTOMER_LAST)
  on(CVMBurberry20Page).verify_reassignment_history($USER_1, $USER_2, $CUSTOMER_FIRST + ' ' + $CUSTOMER_LAST).should be true
end

And(/^I should be able to see no selected customer message$/) do
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'Tools'
  on(Burberry20Page).select_left_link_containing 'CVM Reassignment'
  on(CVMBurberry20Page).verify_no_selected_customer_message.should be true
end

And(/^I should be able to verify reassignment message$/) do
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'Tools'
  on(Burberry20Page).select_left_link_containing 'CVM Reassignment'
  number_of_customers = on(CVMBurberry20Page).get_number_of_customers($USER_1)
  on(CVMBurberry20Page).reassign_customer($USER_1, $USER_2, $CUSTOMER_FIRST + ' ' + $CUSTOMER_LAST)
  on(CVMBurberry20Page).verify_number_of_customers($USER_1, number_of_customers).should equal 1
end

And(/^Temp action$/) do
  on(CustomersContactsPage).transcripts
end