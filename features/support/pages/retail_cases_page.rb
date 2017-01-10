class RetailCasesPage < AbstractPage
  include PageObject

  text_field(:set_name, id: 'Name')

  def create_retail_vendor
    new_element.when_present.click
    set_name_element.when_present.send_keys $RETAIL_VENDOR
    save_element.click
    edit_element.when_visible
  end

  select_list(:tier, :id => 'p3')
  button(:continue, :name => 'save', :value => 'Continue')
  text_field(:subject, xpath: "//label[text()='Subject']/ancestor::td/following-sibling::td[1]//input")
  select_list(:status_select, xpath: "//label[text()='Status']/ancestor::td/following-sibling::td[1]//select")
  text_field(:vendor, xpath: "//label[text()='Vendor']/ancestor::td/following-sibling::td[1]//span/input")

  def create_retail_case(status)
    new_element.when_present.click
    tier_element.when_present.select 'Retail'
    continue_element.when_present.click
    subject_element.when_present.send_keys $RETAIL_CASE
    status_select_element.when_present.select status
    vendor_element.when_present.send_keys $RETAIL_VENDOR
    save_element.click
    br.element(xpath: "//div[@title='" + $RETAIL_CASE + "']").when_present
  end

  link(:case_number, xpath: "//div[@class='rstitle']/a")

  def get_case_number
    find_item($RETAIL_CASE, 'Cases')
    case_number_element.when_present.text
  end

  link(:details, xpath: "//span[text()='Details']/ancestor::a")

  def find_and_delete_case(item, category)
    find_item(item, category)
    details_element.when_present.click
    delete_element.when_present.click
    br.alert.ok
    sleep 2
  end

end
