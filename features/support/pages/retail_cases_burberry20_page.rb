class RetailCasesBurberry20Page < Burberry20Page
  include PageObject

  text_field(:case_number, xpath: "//input[@placeholder='CASE NUMBER']")
  text_field(:vendor, xpath: "//input[@placeholder='VENDOR']")
  strong(:search, xpath: "//strong[text()='Search']")

  def find_case_by_number(case_number)
    case_number_element.wait_until_present.send_keys case_number
    search_element.wait_until_present.click
    br.element(xpath: "//a[text()='" + case_number + "']").wait_until_present.exists?
  end

  def find_case_by_vendor(case_number, vendor)
    vendor_element.wait_until_present.send_keys vendor
    search_element.wait_until_present.click
    br.element(xpath: "//a[text()='" + case_number + "']").wait_until_present.exists?
  end

  select_list(:status, xpath: "//option[@value='Closed']/ancestor::select")

  def find_case_by_status(case_number, vendor, status)
    vendor_element.wait_until_present.send_keys vendor
    status_element.wait_until_present.select status
    search_element.wait_until_present.click
    br.element(xpath: "//a[text()='" + case_number + "']").wait_until_present.exists?
  end

  strong(:save_changes, xpath: "//strong[text()='Save Changes']")

  def change_case_status(case_number)
    case_number_element.wait_until_present.send_keys case_number
    search_element.wait_until_present.click
    br.element(xpath: "//a[text()='" + case_number + "']").wait_until_present.click
    status_element.wait_until_present.select 'Closed'
    save_changes_element.wait_until_present.click
  end

end