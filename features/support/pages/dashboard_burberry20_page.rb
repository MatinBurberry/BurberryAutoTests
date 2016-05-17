class DashboardBurberry20Page < Burberry20Page
  include PageObject

  select_list(:dashboard_select, :xpath => "//div[@id='chatter-filter']/select")
  div(:chatter_filter, xpath: "//div[@id='chatter-filter']")
  li(:media_item, xpath: "//li[contains(@class,'js-feed-item media')]")

  text_area(:message_area, xpath: "//textarea[text()='What are you working on?']")

  def create_a_post(message)
    message_area_element.when_present.send_keys message
    br.element(xpath: "//div[@class='container status-update']//strong[text()='Post']").when_present.click
    br.element(xpath: "//p[contains(text(),'" + message + "')]").when_present
  end

  def select_dashboard_filter(filter_name)
    chatter_filter_element.when_present
    dashboard_select_element.select(filter_name)
    begin
      media_item_element.when_present
    rescue
    end
  end

  def verify_post(message)
    br.element(xpath: "//p[contains(text(),'" + message + "')]").when_present.exists?
  end

  link(:post_author, xpath: "//ul[@class='feed-container js-feed-container']//a[@class='author']")
  link(:post_text, xpath: "//p[contains(text(),'I just made an')]/a[text()='#Icon2016']")

  def verify_icon_post
    post_author_element.when_present
    post_text_element.exists?
  end

  def delete_post(post)
    br.element(xpath: "//p[contains(text(),'" + post + "')]").when_present.hover
    br.element(xpath: "//p[contains(text(),'" + post + "')]/preceding-sibling::a/span").when_present.click
    br.element(xpath: "//strong[text()='Yes']").when_present.click
    sleep 3
  end

  text_area(:share_post_comment, id: 'sharePostComment')
  div(:shared_post_message, xpath: "//div[contains(text(),'You have shared this post to')]")

  def share_a_post(message)
    br.element(xpath: "//p[text()='" + message + "']/..//a[text()='Share']").when_present.click
    share_post_comment_element.when_present.send_keys (message + ' share comment')
    br.element(xpath: "//div[@class='modal-buttons']//strong[text()='Share']").when_present.click
    shared_post_message_element.when_present
  end

  link(:your_profile, text: 'your profile')

  def verify_shared_post(message)
    your_profile_element.when_present.click
    br.element(xpath: "//p[contains(text(),'" + (message + ' share comment') + "')]").when_present.exists?
  end

end