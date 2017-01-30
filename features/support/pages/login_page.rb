class LoginPage < AbstractPage
  include PageObject

  text_field(:username, :id => 'username')
  text_field(:password, :id => 'password')
  button(:login, :id => 'Login')

  # def login_to_system(username = FigNewton.test_username, password = FigNewton.test_password)
  #   self.username = username
  #   self.password = password
  #   login
  #   go_to_salesforce
  # end

  button(:continue, xpath: "//input[@value='Continue']")

  def login_to_system(username = FigNewton.test_username, password = FigNewton.test_password)
    br.goto ('https://burberry--dev--c.cs85.visual.force.com/?un=' + username + '&pw=' + password)
    sleep 3
    #if continue_element.exists?

    begin
      set_implicit_wait(3)
      continue_element.click
    rescue

    ensure
      set_implicit_wait
    end
    go_to_salesforce
  end

  span(:user_label, id: 'userNavLabel')
  link(:logout, text: 'Logout')

  def logout_from_system
    #go_to_salesforce
    #user_label_element.when_present.click
    #logout_element.when_present.click
    #br.wait_until { browser.url.include?("salesforce.com") }
    #br.goto (FigNewton.base_url)
    #username_element.when_present
  end
end