require 'watir'
require 'selenium-webdriver'

Before do
  case ENV['BROWSER']
    when 'chrome'
      @browser = Watir::Browser.new :chrome
    when 'ie', 'explorer'
      @browser = Watir::Browser.new :ie
    else
      @browser = Watir::Browser.new :chrome
  end

  $DEFAULT_IMPLICIT_WAIT = 60
  @browser.driver.manage.timeouts.implicit_wait = $DEFAULT_IMPLICIT_WAIT

  @browser.driver.manage.window.maximize
  generate_test_data
end

def generate_test_data
  $UN = Time.now.strftime(' %m%d_%H%M%S')
  $USER_1 = (FigNewton.first_name_1 + ' ' + FigNewton.last_name_1)
  $USER_2 = (FigNewton.first_name_2 + ' ' + FigNewton.last_name_2)
  $USER_3 = (FigNewton.first_name_3 + ' ' + FigNewton.last_name_3)

  $POST = 'Auto post' + $UN
  $GROUP = 'Auto group' + $UN
  $KNOWLEDGE_CATEGORY_1 = 'Automation Tier 1' + $UN
  $KNOWLEDGE_CATEGORY_2 = 'Automation Tier 2' + $UN
  $KNOWLEDGE_CATEGORY_3 = 'Automation Tier 3' + $UN
  $AWARD_CATEGORY = 'Auto Award Category' + $UN
  $AWARD_FAQ_SET = 'Auto FAQ Set' + $UN
  $AWARD_CYCLE = 'Auto Award Cycle' + $UN

  $VOLUNTEER_ACTIVITY = 'Auto Volunteer Activity' + $UN
  $VOLUNTEER_ORGANIZATION = 'Auto Volunteer Organization' + $UN

  $NEWS_TITLE = 'Auto News Title' + $UN
  $NEWS_HEADLINE = 'Auto News Headline' + $UN
  $NEWS_EXCERPT = 'Auto News Excerpt' + $UN

  $RETAIL_VENDOR = 'Auto Retail Vendor' + $UN
  $RETAIL_CASE = 'Auto Retail Case' + $UN

  $GIFT_DESC = 'Auto Gift' + $UN

  $HR_CASE = 'Auto HR Case' + $UN
  $HR_CASE_NUMBER = ''

  $CUSTOMER_FIRST = 'John' + $UN
  $CUSTOMER_LAST = 'Doe' + $UN

end

After do
  @browser.close
end

After('@1post') do
  begin
    on(Burberry20Page).select_left_link_containing 'Dashboard'
    on(DashboardBurberry20Page).delete_post $POST
  rescue
    on(AbstractPage).log_deletion_warning($POST)
  end
end

After('@2posts') do
  begin
    on(Burberry20Page).select_left_link_containing 'Dashboard'
    on(DashboardBurberry20Page).delete_post $POST
    on(DashboardBurberry20Page).delete_post $POST
  rescue
    on(AbstractPage).log_deletion_warning($POST)
  end
end

After('@group') do
  begin
    on(GroupsBurberry20Page).delete_group $GROUP
  rescue
    on(AbstractPage).log_deletion_warning($GROUP)
  end
end

After('@policy') do
  begin
    on(HomePage).go_to_salesforce
    on(HomePage).find_and_delete_item($KNOWLEDGE_CATEGORY_1, 'Knowledge Categories')
    on(HomePage).find_and_delete_item($KNOWLEDGE_CATEGORY_2, 'Knowledge Categories')
    on(HomePage).find_and_delete_item($KNOWLEDGE_CATEGORY_3, 'Knowledge Categories')
  rescue
    on(AbstractPage).log_deletion_warning($KNOWLEDGE_CATEGORY_1)
  end
end

After('@policy_1_2') do
  begin
    on(HomePage).go_to_salesforce
    on(HomePage).find_and_delete_item($KNOWLEDGE_CATEGORY_1, 'Knowledge Categories')
    on(HomePage).find_and_delete_item($KNOWLEDGE_CATEGORY_2, 'Knowledge Categories')
  rescue
    on(AbstractPage).log_deletion_warning($KNOWLEDGE_CATEGORY_1)
  end
end

After('@award_cycle') do
  begin
    on(HomePage).go_to_salesforce
    on(HomePage).find_and_delete_item($AWARD_CYCLE, 'Award Cycles')
  rescue
    on(AbstractPage).log_deletion_warning($AWARD_CYCLE)
  end
end

After('@award_faq_set') do
  begin
    on(HomePage).go_to_salesforce
    on(HomePage).find_and_delete_item($AWARD_FAQ_SET, 'FAQ Sets')
  rescue
    on(AbstractPage).log_deletion_warning($AWARD_FAQ_SET)
  end
end

After('@award_category') do
  begin
    on(HomePage).go_to_salesforce
    on(HomePage).find_and_delete_item($AWARD_CATEGORY, 'Award Categories')
  rescue
    on(AbstractPage).log_deletion_warning($AWARD_CATEGORY)
  end
end

After('@award_post') do
  begin
    on(DashboardBurberry20Page).delete_post('I just made an')
  rescue
    on(AbstractPage).log_deletion_warning("Post 'I just made an'")
  end
end

After('@volunteer_organization') do
  begin
    on(HomePage).go_to_salesforce
    on(HomePage).find_and_delete_item($VOLUNTEER_ORGANIZATION, 'Volunteer Organizations')
  rescue
    on(AbstractPage).log_deletion_warning($VOLUNTEER_ORGANIZATION)
  end
end

After('@volunteer_activity') do
  begin
    on(HomePage).go_to_salesforce
    on(HomePage).find_and_delete_item($VOLUNTEER_ACTIVITY, 'Volunteer Activities')
  rescue
    on(AbstractPage).log_deletion_warning($VOLUNTEER_ACTIVITY)
  end
end

After('@news_story') do
  begin
    on(HomePage).go_to_salesforce
    on(HomePage).find_and_delete_item($NEWS_TITLE, 'News Stories')
  rescue
    # .. handle error
    on(AbstractPage).log_deletion_warning($NEWS_TITLE)
  end
end

After('@retail_vendor') do
  begin
    on(HomePage).go_to_salesforce
    on(HomePage).find_and_delete_item($RETAIL_VENDOR, 'Retail Vendors')
  rescue
    # .. handle error
    on(AbstractPage).log_deletion_warning($RETAIL_VENDOR)
  end
end

After('@retail_case') do
  begin
    on(HomePage).go_to_salesforce
    on(RetailCasesPage).find_and_delete_case($RETAIL_CASE, 'Cases')
  rescue
    # .. handle error
    on(AbstractPage).log_deletion_warning($RETAIL_CASE)
  end
end

After('@corporate_gift') do
  begin
    on(HomePage).go_to_salesforce
    on(ToolsPage).delete_corporate_gift $GIFT_DESC
  rescue
    # .. handle error
    on(AbstractPage).log_deletion_warning($GIFT_DESC)
  end
end

After('@cvm') do
  begin
    on(HomePage).go_to_salesforce
    on(HomePage).find_and_delete_item($CUSTOMER_FIRST + ' ' + $CUSTOMER_LAST, 'Customers/Contacts')
  rescue
    # .. handle error
    on(AbstractPage).log_deletion_warning($CUSTOMER_FIRST + ' ' + $CUSTOMER_LAST)
  end
end

After('hr_case') do
  begin
    on(HomePage).go_to_salesforce
    on(HomePage).find_and_delete_item(case_number, 'Ask HR Cases')
  rescue
    # .. handle error
    on(AbstractPage).log_deletion_warning(case_number)
  end
end

After do |scenario|
  if scenario.failed?
    time = Time.now.strftime("%Y-%m-%d_%H-%M-%S")
    filename = File.join(on(AbstractPage).get_base_dir, "/results/screenshots/", "screenshotserror-#{@current_page.class}-#{time}.png")
    @current_page.save_screenshot(filename)
    embed(filename, 'image/png')
  end
end
