class CVMBurberry20Page < Burberry20Page
  include PageObject

  div(:user_1, xpath: "//div[@id='chatter-filter']")

  text_field(:group_name, :id => 'fdnCreateGroup_groupName')
  text_area(:group_description, :id => 'fdnCreateGroup_description')
  radio_button(:public_radio, :id => 'fdnCreateGroup_groupTypePublic')
  radio_button(:private_radio, :id => 'fdnCreateGroup_groupTypePrivate')
  link(:change_thumbnail, :class => 'js-change-thumbnail')
  strong(:create_new_group, xpath: "//div[@id='tab-MyGroups']//strong[text()='Create New Group']")
  strong(:use, xpath: "//strong[text()='Use']")
  strong(:create_group, xpath: "//strong[text()='Create Group']")
  strong(:edit, xpath: "//strong[text()='EDIT']")
  select(:sort_customers_by, xpath: "//select[@class='sortCustomers']")

  def sort_customers(option)
    sleep 2
    sort_customers_by_element.select option
    sleep 2
  end

  def select_sa(sa)
    br.element(xpath: "//div[contains(text(),'" + sa + "')]").when_present.click
    sleep 2
    #br.element(xpath: "/div[contains(text(),'" + sa + "')]/parent::div[contains(@class, 'element-highlighted')]").wait_until_present
  end

  def verify_customer_assignment(sa, customer)
    select_sa sa
    sort_customers 'Descending (Z-A)'
    br.element(xpath: "//strong[contains(text(),'" + customer + "')]").when_present.exists?
  end

  def verify_customer_info(sa, customer)
    select_sa sa
    sort_customers 'Descending (Z-A)'
    result = br.element(xpath: "//strong[contains(text(),'" + customer + "')]").when_present.exists?
    result && br.element(xpath: "//strong[contains(text(),'" + customer + "')]/../div[text()='Paris, France']").when_present.exists?
    result && br.element(xpath: "//strong[contains(text(),'" + customer + "')]/../div[text()='Classic, Exited, £ 1,500']").when_present.exists?
  end

  button(:reassign_customer, xpath:"//input[@class='reassign-btn']")
  select_list(:to, xpath: "//div[text()='To']/..//select")
  select_list(:for, xpath: "//div[text()='For']/..//select")
  button(:confirm, xpath:"//input[@class='confirm-btn']")
  button(:back_to_home_page, xpath:"//input[@value='Back to home page']")
  div(:notification, xpath: "//div[text()='You are reassigning 1 customers']")

  def reassign_customer(user_from, user_to, customer)
    select_sa user_from
    sort_customers 'Descending (Z-A)'
    br.element(xpath: "//strong[contains(text(),'" + customer + "')]/../../input").when_present.click
    reassign_customer_element.click
    notification_element.when_present
    to_element.select user_to
    sleep 2
    for_element.select 'Other'
    sleep 2
    confirm_element.when_present.click
    sleep 2
    back_to_home_page_element.when_present.click
  end

  def verify_reassignment_history(sa_from, sa_to, customer)
    select_sa sa_to
    sort_customers 'Descending (Z-A)'
    br.element(xpath: "//strong[contains(text(),'" + customer + "')]").when_present.click
    sleep 2
    br.element(xpath: "//td[contains(text(),'" + sa_from + "')]/following-sibling::td[contains(text(),'" + sa_to + "')]/following-sibling::td[contains(text(),'" + date_offset_formatted(0, "%d/%m/%Y") + "')]").exists?
    #br.element(xpath: "//td[contains(text(),'" + sa_from + "')]/following-sibling::td[contains(text(),'" + sa_to + "')]/following-sibling::td[contains(text(),'11/07/2016')]").exists?
  end

  div(:select_customer_message, xpath: "//div[text()='Please select customers']")

  def verify_no_selected_customer_message
    reassign_customer_element.click
    select_customer_message_element.when_present.exists?
  end

  span(:reassign_message, xpath: "//span[text()='Customers should be re-assigned only in case of sales associates leaving the business or for exceptional reasons such as long term leave; please make sure you limit the number of times customers get re-assigned.']")

  def verify_reassign_message(user_from, customer)
    select_sa user_from
    sort_customers 'Descending (Z-A)'
    br.element(xpath: "//strong[contains(text(),'" + customer + "')]/../../input").when_present.click
    reassign_customer_element.click
    reassign_message_element.when_present.exists?
  end

  def get_number_of_customers(sa)
    br.element(xpath: "//div[contains(text(),'" + sa + "')]/..//span[contains(@class,'bar-size')]").when_present.text
  end

  def verify_number_of_customers(sa, number_before)
    number_before.to_i - (get_number_of_customers sa).to_i
  end

  select_list(:customer_type, xpath: "//div[text()='CUSTOMER TYPE']/..//select")
  select_list(:title, xpath: "//div[text()='TITLE']/..//select")
  select_list(:city, xpath: "//div[text()='CITY']/..//select")
  select_list(:country, xpath: "//div[text()='COUNTRY']/..//select")
  select_list(:tier, xpath: "//div[text()='TIER']/..//select")
  select_list(:status, xpath: "//div[text()='STATUS']/..//select")


  def verify_customer_filters(user_from, customer)
    select_sa user_from
    sleep 2
    customer_type_element.select 'New'
    sleep 2
    title_element.select 'Mr'
    sleep 2
    city_element.select 'Paris'
    sleep 2
    country_element.select 'France'
    sleep 2
    tier_element.select 'Classic'
    sleep 2
    status_element.select 'Exited'
    sleep 2
    sort_customers 'Descending (Z-A)'
    br.element(xpath: "//strong[contains(text(),'" + customer + "')]").when_present.exists?
  end

  text_field(:search_customer, xpath: "//div[text()='SEARCH CUSTOMER']/..//input")
  span(:search_customer_button, xpath: "//a[@class='search-customers-icon']/span[@class='icn search-black']")

  def verify_customer_search(user_from, customer)
    select_sa user_from
    sleep 2
    search_customer_element.send_keys customer
    search_customer_button_element.click
    sleep 2
    br.element(xpath: "//strong[contains(text(),'" + customer + "')]").when_present.exists?
  end


end
