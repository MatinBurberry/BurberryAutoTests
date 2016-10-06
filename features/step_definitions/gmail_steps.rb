When(/^I login to Gmail$/) do
  visit(GmailPage)

  on(GmailPage).login_to_gmail

end

Then(/^I can send "([^"]*)" emails to "([^"]*)"$/) do |email_quantity, email|
  on(GmailPage).send_email email_quantity, email
end