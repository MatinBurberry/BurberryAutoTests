class LoginPage < AbstractPage
  include PageObject

  text_field(:username, :id => 'username')
  text_field(:password, :id => 'password')
  button(:login, :id => 'Login')

  def login_to_system(username = FigNewton.test_username, password = FigNewton.test_password)
    self.username = username
    self.password = password
    login
    go_to_salesforce
  end

  span(:user_label, id: 'userNavLabel')
  link(:logout, text: 'Logout')

  def logout_from_system
    go_to_salesforce
    user_label_element.when_present.click
    logout_element.when_present.click
    br.wait_until{browser.url.include?("salesforce.com")}
    br.goto (FigNewton.base_url)
    username_element.when_present
  end
end