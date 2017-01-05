class FoundationBurberry20Page < Burberry20Page
  include PageObject

  span(:close_sign_up, xpath: "//div[@class='mod sign-up']/../..//span[@class='icn cross-grey99 cross-white-hover']")

  def get_volunteer_activity_name(name)
    @browser.element(xpath: "//h4[text()='" + name + "']").wait_until_present.text
  end

  def sign_up_for_activity(activity_name)
    br.element(xpath: "//h4[text()='"+activity_name+"']/ancestor::div[@class='title cleared']//strong[text()='Sign Up']").wait_until_present.click
    br.element(xpath: "//h3[text()='Thank you for signing up']").wait_until_present.text
    br.element(xpath: "//p[text()='A member of the Community Investment team will be in touch shortly.']").wait_until_present.text
    close_sign_up_element.wait_until_present.click
    br.element(xpath: "//h4[text()='"+activity_name+"']/ancestor::div[@class='title cleared']//strong[text()='Signed Up']").wait_until_present.exists?
  end

  text_area(:private_message, id: 'private-message')

  def ask_question(activity_name)
    br.element(xpath: "//h4[text()='"+activity_name+"']/ancestor::div[@class='title cleared']//strong[text()='Ask A Question']").wait_until_present.click
    private_message_element.wait_until_present.send_keys ('Auto Question for activity ' + activity_name)
    br.element(:xpath => "//strong[text()='Send']").wait_until_present.click
    sleep 2
  end

  def read_question(activity_name)
    sleep 5
    br.element(xpath: "//li[@class='menu-item js-msg-dd']").wait_until_present.click
    br.element(xpath: "//a[@class='conversation']").wait_until_present.click
    br.element(xpath: "//p[contains(text(),'" + activity_name+"')]").wait_until_present.exists?
  end

end
