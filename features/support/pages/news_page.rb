class NewsPage < AbstractPage
  include PageObject

  text_field(:title, xpath: "//label[text()='Title']/ancestor::td/following-sibling::td[1]//input")
  text_area(:headline, xpath: "//label[text()='Headline']/ancestor::td/following-sibling::td[1]//textarea")
  text_area(:tags, xpath: "//label[text()='Tags']/ancestor::td/following-sibling::td[1]//textarea")
  text_area(:excerpt, xpath: "//label[text()='Excerpt']/ancestor::td/following-sibling::td[1]//textarea")
  select_list(:status, xpath: "//label[text()='Status']/ancestor::td/following-sibling::td[1]//select")
  checkbox(:public, xpath: "//label[text()='Public']/ancestor::td/following-sibling::td[1]//input")
  checkbox(:featured, xpath: "//label[text()='Featured']/ancestor::td/following-sibling::td[1]//input")
  checkbox(:enable_chat, xpath: "//label[text()='Enable Chat']/ancestor::td/following-sibling::td[1]//input")

  def create_news_story(public, featured, enable_chat)
    new_element.when_present.click
    title_element.when_present.send_keys $NEWS_TITLE
    headline_element.when_present.send_keys $NEWS_HEADLINE
    excerpt_element.when_present.send_keys $NEWS_EXCERPT
    tags_element.when_present.send_keys 'auto test'
    status_element.when_present.select 'Published'
    if public
      public_element.when_present.check
    end
    if featured
      featured_element.when_present.check
    end
    if enable_chat
      enable_chat_element.when_present.check
    end

    sleep 3
    save_element.when_present.click
  end

end
