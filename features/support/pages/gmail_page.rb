class GmailPage < AbstractPage
  include PageObject

  page_url FigNewton.gmail_url

  text_field(:email, :id => 'Email')
  text_field(:password, :id => 'Passwd')
  button(:next, id: 'next')
  button(:sign_in, id: 'signIn')

  def login_to_gmail(username = FigNewton.gmail_username, password = FigNewton.gmail_password)
    email_element.send_keys username
    next_element.click
    password_element.send_keys password
    sign_in_element.click
    br.goto FigNewton.gmail_url
    sleep 5
  end

  div(:compose, xpath: "//div[text()='COMPOSE']")
  text_area(:email_to, name: 'to')
  text_field(:subject, name: 'subjectbox')
  div(:message_body, xpath: "//div[@aria-label='Message Body']")
  div(:send_button, text: "Send")

  def send_email (email_quantity, email_to)
    for i in 1..email_quantity.to_i do
      compose_element.click
      email_to_element.send_keys email_to
      subject_element.send_keys "Auto Test 1253 - " + Time.now.strftime(' %m%d_%H%M%S')
      message_body_element.send_keys "Test Email Message " + i.to_s
      send_button_element.click
      sleep 2
    end
  end
end