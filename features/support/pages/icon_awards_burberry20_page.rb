class IconAwardsBurberry20Page < Burberry20Page
  include PageObject

  link(:nominate, class: 'button awards-nominate js-awards-nominate')
  select_list(:category, xpath: "//option[text()='Select a category']/parent::select")
  text_field(:nominant, class: 'js-nom-input')
  text_area(:reason, class: 'js-text reason-text')
  link(:nominate_save, class: 'button nominate-button js-nominate-button')
  span(:close, class: 'icn cross-grey99 cross-white-hover')

  def nominate(category, nominant)
    sleep 10
    nominate_element.when_present.click
    category_element.when_present.select(category)
    nominant_element.send_keys nominant
    nominant_element.click
    br.element(xpath: "//div[@class='js-individual-fieldset']//p[text()='" + nominant + "']").when_present.click
    reason_element.send_keys 'Automation test reason for nomination should be at least 50 characters long.'
    nominate_save_element.when_present.click
    br.element(xpath: "//p[text()='Thank you for your nomination']").when_present
  end

  def nominate_no_post(category, nominant)
    nominate(category, nominant)
    close_element.when_present.click
  end

  link(:tell_followers, text: 'Tell your followers about the awards')
  p(:nomination_message, xpath: "//p[contains(text(), 'I just made an')]")
  link(:post_to_profile, text: 'Post to your profile')

  def nominate_and_post(category, nominant)
    nominate(category, nominant)
    tell_followers_element.when_present.click
    nomination_message_element.when_present
    post_to_profile_element.when_present.click
    close_element.when_present.click
    sleep 3
  end

  def nominate_check_description(category, nominant)
    sleep 15
    nominate_element.when_present.click
    category_element.when_present.select(category)
    nominant_element.send_keys nominant
    sleep 5
    br.element(xpath: "//div[@class='js-individual-fieldset']//p[text()='" + nominant + "']").when_present.click
    reason_element.send_keys 'Automation test less than 50 characters (49 char)'
    actual = br.element(xpath: "//label[@class='js-word-count input-label input-label-error input-label-info']").when_present.text
    close_element.when_present.click
    actual
  end

  def get_finalist_name(name)
    br.element(link: name).when_present.click
    br.element(xpath: "//dt[text()='" + name + "']").when_present.text
  end

  def get_winner_name(category, name)
    br.element(xpath: "//h3[contains(text(),'" + category + "')]").when_present.click
    br.element(link: name).when_present.click
    br.element(xpath: "//dt[text()='" + name + "']").when_present.text
  end

  def verify_winner_image(category)
    br.element(xpath: "//h3[contains(text(),'" + category + "')]").when_present.click
    sleep 3
    br.execute_script("return (typeof arguments[0].naturalWidth!=\"undefined\" && arguments[0].naturalWidth>0)", br.image(xpath: "//div[@class='awards-winner-image']//img"))
  end

  def get_icon_awards_widget_name
    br.element(xpath: "//h2[text()='Icon Awards 2016']").when_present.text
  end

  h1(:archive_title, xpath: "//h1[text()='Icon Awards Archive']")
  h3(:category_item, xpath: "//div[@class='category-content']//h3")

  def verify_archive(category, winner)
    result = archive_title_element.when_present.exists?
    result && category_item_element.when_present.exists?
    result && br.element(xpath: "//div[@class='category-content']//h3[text()='" + category + "']").when_present.exists?
    result && br.element(xpath: "//p[text()='" + winner + "']").exists?
  end

  p(:law_message, xpath: "//p[contains(text(),'This programme shall be governed and construed by English law')]")
  p(:nominations_open, xpath: "//p[text()='Nominations open']")

  def verify_FAQ
    result = law_message_element.when_present.exists?
    result && nominations_open_element.when_present.exists?
  end

end
