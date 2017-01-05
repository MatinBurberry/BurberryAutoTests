class DashboardBurberry20Page < Burberry20Page
  include PageObject

  select_list(:dashboard_select, :xpath => "//div[@id='chatter-filter']/select")
  div(:chatter_filter, xpath: "//div[@id='chatter-filter']")
  li(:media_item, xpath: "//li[@id='status-update')]")

  text_area(:message_area, xpath: "//textarea[text()='What are you working on?']")

  def create_a_post(message)
    message_area_element.wait_until_present.send_keys message
    br.element(xpath: "//div[@class='container status-update']//strong[text()='Post']").wait_until_present.click
    br.element(xpath: "//p[contains(text(),'" + message + "')]").wait_until_present
  end

  def select_dashboard_filter(filter_name)
    chatter_filter_element.wait_until_present
    dashboard_select_element.select(filter_name)
    begin
      media_item_element.wait_until_present
    rescue
    end
  end

  def verify_post(message)
    br.element(xpath: "//p[contains(text(),'" + message + "')]").wait_until_present.exists?
  end

  link(:post_author, xpath: "//ul[@class='feed-container js-feed-container']//a[@class='author']")
  link(:post_text, xpath: "//p[contains(text(),'I just made an')]/a[text()='#Icon2016']")

  def verify_icon_post
    post_author_element.wait_until_present
    post_text_element.exists?
  end

  def delete_post(post)
    br.element(xpath: "//p[contains(text(),'" + post + "')]").wait_until_present.hover
    br.element(xpath: "//p[contains(text(),'" + post + "')]/preceding-sibling::a/span").wait_until_present.click
    br.element(xpath: "//strong[text()='Yes']").wait_until_present.click
    sleep 3
  end

  text_area(:share_post_comment, id: 'sharePostComment')
  div(:shared_post_message, xpath: "//div[contains(text(),'You have shared this post to')]")

  def share_a_post(message)
    br.element(xpath: "//p[text()='" + message + "']/..//a[text()='Share']").wait_until_present.click
    share_post_comment_element.wait_until_present.send_keys (message + ' share comment')
    br.element(xpath: "//div[@class='modal-buttons']//strong[text()='Share']").wait_until_present.click
    shared_post_message_element.wait_until_present
  end

  link(:your_profile, text: 'your profile')

  def verify_shared_post(message)
    your_profile_element.wait_until_present.click
    br.element(xpath: "//p[contains(text(),'" + (message + ' share comment') + "')]").wait_until_present.exists?
  end

end