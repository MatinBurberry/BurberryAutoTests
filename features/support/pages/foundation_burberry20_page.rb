class FoundationBurberry20Page < Burberry20Page
  include PageObject

  span(:close_sign_up, xpath: "//div[@class='mod sign-up']/../..//span[@class='icn cross-grey99 cross-white-hover']")

  def get_volunteer_activity_name(name)
    @browser.element(xpath: "//h4[text()='" + name + "']").when_present.text
  end

  def sign_up_for_activity(activity_name)
    br.element(xpath: "//h4[text()='"+activity_name+"']/ancestor::div[@class='title cleared']//strong[text()='Sign Up']").when_present.click
    br.element(xpath: "//h3[text()='Thank you for signing up']").when_present.text
    br.element(xpath: "//p[text()='A member of the Community Investment team will be in touch shortly.']").when_present.text
    close_sign_up_element.when_present.click
    br.element(xpath: "//h4[text()='"+activity_name+"']/ancestor::div[@class='title cleared']//strong[text()='Signed Up']").when_present.exists?
  end

  text_area(:private_message, id: 'private-message')

  def ask_question(activity_name)
    br.element(xpath: "//h4[text()='"+activity_name+"']/ancestor::div[@class='title cleared']//strong[text()='Ask A Question']").when_present.click
    private_message_element.when_present.send_keys ('Auto Question for activity ' + activity_name)
    br.element(:xpath => "//strong[text()='Send']").when_present.click
    sleep 2
  end

  def read_question(activity_name)
    sleep 5
    br.element(xpath: "//li[@class='menu-item js-msg-dd']").when_present.click
    br.element(xpath: "//a[@class='conversation']").when_present.click
    br.element(xpath: "//p[contains(text(),'" + activity_name+"')]").when_present.exists?
  end

end
