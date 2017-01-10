class ToolsPage < AbstractPage
  include PageObject

  def find_corporate_gift(item)
    search_field_element.when_present.send_keys item
    find_element.when_present.click
    begin
      br.element(xpath: "//span[contains(text(),'Corporate Gifts')]/ancestor::div[@class='bPageBlock brandSecondaryBrd secondaryPalette']//a[contains(text(), 'CG-')]").when_present.click
    rescue
      search_all_element.when_present.click
      br.element(xpath: "//span[contains(text(),'Corporate Gifts')]/ancestor::div[@class='bPageBlock brandSecondaryBrd secondaryPalette']//a[contains(text(), 'CG-')]").when_present.click
    end
  end

  def delete_corporate_gift(item)
    find_corporate_gift(item)
    delete_element.when_present.click
    br.alert.ok
    sleep 2
  end

  select_list(:approval_status, xpath: "//label[text()='Approval Status']/ancestor::td/following-sibling::td[1]//select")

  def approve_corporate_gift_received(item)
    find_corporate_gift(item)
    edit_element.when_present.click
    approval_status_element.when_present.select 'Approved'
    save_element.click
    sleep 2
  end

  text_field(:burberry_product_code, xpath: "//label[text()='Burberry Product Code']/ancestor::td/following-sibling::td[1]//input")

  def approve_corporate_gift_given(item)
    find_corporate_gift(item)
    edit_element.when_present.click
    approval_status_element.when_present.select 'Approved'
    burberry_product_code_element.send_keys '200'
    save_element.click
    sleep 2
  end

end
