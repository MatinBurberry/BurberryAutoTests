class NavigationBurberry20Page < Burberry20Page
  include PageObject

  link(:burberry_logo, title: 'Burberry')
  text_area(:message_area, xpath: "//textarea[text()='What are you working on?']")
  select_list(:dashboard_select, xpath: "//div[@id='chatter-filter']/select")
  select_list(:sort_by_select, xpath: "//div[@id='chatter-sort']/select")

  def verify_dashboard_page
    sections = Array['News', 'Trending Topics', 'BURBERRY ON TWITTER', 'QUICK LINKS', 'Recommended People', 'WORLD CLOCK']
    burberry_logo_element.wait_until_present.exists?
    sections.size.times do |i|
      br.element(xpath: "//h2[text()='" + sections[i] + "']").wait_until_present.exists?
    end
    message_area_element.wait_until_present.exists?
    dashboard_select_element.exists?
    sort_by_select_element.exists?
  end


  link(:my_groups, text: 'My Groups')
  link(:all_groups, text: 'All Groups')
  select_list(:my_groups_filter_select, :xpath => "//div[@id='my-groups-filter']/select")
  select_list(:my_groups_sort_select, :xpath => "//div[@id='my-groups-sort']/select")
  select_list(:all_groups_filter_select, :xpath => "//div[@id='all-groups-filter']/select")
  select_list(:all_groups_sort_select, :xpath => "//div[@id='all-groups-sort']/select")

  def verify_groups_page
    br.element(:xpath => "//div[@id='tab-MyGroups']//strong[text()='Create New Group']").wait_until_present.exists?
    my_groups_element.wait_until_present.exists?
    all_groups_element.wait_until_present.exists?
    my_groups_filter_select_element.exists?
    my_groups_sort_select_element.exists?
    all_groups_element.click
    all_groups_filter_select_element.exists?
    all_groups_sort_select_element.exists?
  end

  link(:policies, xpath: "//a[contains(text(),'Policies')]")
  link(:retail, xpath: "//a[contains(text(),'Retail')]")

  def verify_knowledge_page
    policies_element.wait_until_present.click
    br.element(xpath: "//h2[text()='Policies Knowledge']").wait_until_present.exists?
    retail_element.wait_until_present.click
    br.element(xpath: "//h2[text()='Retail Knowledge']").wait_until_present.exists?
  end

  h3(:tags, text: 'Tags')
  link(:all_news, text: 'All News')
  h2(:news_section, xpath: "//h2[contains(text(),'News')]")

  def verify_news_page
    tags_element.wait_until_present.exists?
    all_news_element.wait_until_present.exists?
    news_section_element.wait_until_present.exists?
  end

  h2(:foundation_section, xpath: "//h2[contains(text(),'Foundation Background')]")
  h2(:volunteering_opportunities_section, xpath: "//h2[contains(text(),'Volunteering Opportunities')]")
  p(:text1, text: 'The Burberry Foundation is a philanthropic organisation dedicated to helping young people realise their full potential through the power of their creativity, focusing predominantly on the cities where the majority of Burberry employees live and work.')
  p(:text2, text: 'Since its establishment in 2008, it has changed the lives of tens of thousands of young people around the globe by providing financial support to innovative charities and leveraging this funding with the enormous creativity, knowledge and dedication of Burberry employees.')
  link(:find_out_more, text: 'Find out more')
  select_list(:foundation_filter_select, :xpath => "//div[@class='js-select-field select-field ']/select")

  def verify_foundation_page
    foundation_section_element.wait_until_present.exists?
    volunteering_opportunities_section_element.wait_until_present.exists?
    text1_element.wait_until_present.exists?
    text2_element.wait_until_present.exists?
    find_out_more_element.wait_until_present.exists?
    foundation_filter_select_element.exists?
  end


end
