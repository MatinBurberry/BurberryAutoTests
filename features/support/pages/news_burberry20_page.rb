class NewsBurberry20Page < Burberry20Page
  include PageObject

  def verify_news(news_headline)
    br.element(xpath: "//h4[text()='" + news_headline + "']").when_present.exists?
  end

  def verify_featured_story(news_headline)
    br.element(xpath: "//a[@class='js-featured featured']//h4[text()='" + news_headline + "']").when_present.exists?
  end

  text_area(:message_area, xpath: "//div[@class='container status-update']/textarea")

  def verify_news_chat(news_headline)
    br.element(xpath: "//h4[text()='" + news_headline + "']/ancestor::a").when_present.click
    message_area_element.when_present.click
    message_area_element.when_present.send_keys 'Chat test message'
    br.element(xpath: "//div[@class='container status-update']//strong[text()='Post']").when_present.click
    br.element(xpath: "//p[contains(text(),'Chat test message')]").when_present.exists?
  end

  def verify_news_tag(news_headline, tag)
    br.element(xpath: "//h4[text()='" + news_headline + "']").when_present.click
    br.element(xpath: "//a[text()='" + tag + "']").when_present.exists?
  end

  span(:like, xpath: "//span[@class='icn thumbup-black thumbup-white-hover']")

  def verify_like_news_story(news_headline)
    br.element(xpath: "//h4[text()='" + news_headline + "']").when_present.click
    sleep 2
    like_element.when_present.click
    sleep 2
    br.element(xpath: "//div[@class='mod-header cleared']//a[contains(@class, 'like-count')]/strong").text
  end

  span(:close_list, xpath: "//a/span[@class='icn cross-grey99 cross-white-hover']")

  def verify_like_list(news_headline)
    br.element(xpath: "//h4[text()='" + news_headline + "']").when_present.click
    sleep 4
    like_element.when_present.click
    sleep 4
    br.element(xpath: "//div[@class='mod-header cleared']//a[contains(@class, 'like-count')]").when_present.click
    result = br.element(xpath: "//a[text()='" + $USER_1 + "']").when_present.exists?
    close_list_element.when_present.click
    result
  end

  link(:follow, xpath: "//a[@class='btn fg-black bg-white bdr-black fg-white-hover bg-black-hover js-btn-follow btn-follow']")
  h2(:news, xpath: "//h2[text()='News']")

  def follow_news_story(news_headline)
    br.element(xpath: "//h4[text()='" + news_headline + "']").when_present.click
    sleep 4
    follow_element.when_present.click
    news_element.when_present.click
    sleep 4
    br.element(xpath: "//strong[text()='Following']").when_present.exists?
  end

  def verify_following_news_story(news_title)
    result = br.element(xpath: "//a[text()='" + news_title + "']").when_present.exists?
    result && br.element(xpath: "//p[text()='Chat test message']").when_present.exists?
  end

end