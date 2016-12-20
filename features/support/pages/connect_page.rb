class ConnectPage < AbstractPage
  include PageObject

  select_list(:status, xpath: "//label[text()='Status']/ancestor::td/following-sibling::td[1]//select")

  def change_hr_case_status(case_number, status)
    find_item(case_number, 'Ask HR Cases')
    edit_element.when_present.click
    status_element.when_present.select status
    save_element.click
    sleep 2
  end

end
