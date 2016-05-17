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
