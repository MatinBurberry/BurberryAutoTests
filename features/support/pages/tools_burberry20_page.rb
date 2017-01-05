class ToolsBurberry20Page < Burberry20Page
  include PageObject

  select_list(:offered, id: 'cgRecordTypes')
  text_field(:first_name, id: 'cgFirstName')
  text_field(:last_name, id: 'cgLastName')
  text_field(:organization, id: 'cgOrganisation')
  select_list(:gift_hospitality, id: 'cgTypes')
  text_field(:date, id: 'cgDateOffered')
  text_area(:description, id: 'cgDescription')
  text_field(:value, id: 'cgValue')
  strong(:submit, xpath: "//strong[text()='SUBMIT']")
  p(:message, xpath: "//p[contains(text(), 'Thank you for your declaration')]")
  strong(:ok, xpath: "//strong[text()='ok']")
  strong(:submit, xpath: "//strong[text()='SUBMIT']")
  link(:first_date, text: '1')

  def declare_gift(option)
    sleep 5
    offered_element.select option
    first_name_element.wait_until_present.send_keys 'John'
    last_name_element.wait_until_present.send_keys 'Doe'
    organization_element.wait_until_present.send_keys 'Auto Test LTD'
    gift_hospitality_element.select 'Gift'
    date_element.wait_until_present.click
    first_date_element.wait_until_present.click
    description_element.wait_until_present.send_keys $GIFT_DESC
    value_element.wait_until_present.send_keys '100'
    submit_element.wait_until_present.click
    message_element.wait_until_present
    ok_element.wait_until_present.click
    br.element(xpath: "//dd[text()='" + $GIFT_DESC + "']").wait_until_present
  end

  def verify_gift_received
    sleep 5
    br.element(xpath: "//td[contains(text(),'" + $GIFT_DESC + "')]").exists?
  end

  strong(:delete_confirm, xpath: "//a[@id='cgDeleteOKButton']/strong")

  def delete_declaration(description)
    br.element(xpath: "//td[contains(text(),'" + description + "')]").click
    br.element(xpath: "//td[contains(text(),'" + description + "')]//strong[text()='DELETE']").wait_until_present.click
    delete_confirm_element.wait_until_present.click
  end

  def verify_gift_status(status)
    sleep 5
    br.element(xpath: "//td[contains(text(),'" + $GIFT_DESC + "')]/../td[text()='APPROVED']").exists?
  end

  h2(:search_purchase_orders, xpath: "//h2[text()='Search purchase orders']")

  def verify_supply_chain_world
    sleep 2
    search_purchase_orders_element.exists?
  end

  def verify_supply_chain_world_uat
    sleep 2
    br.url.end_with? "scwhomenew"
  end

  def verify_store_pages
    sleep 2
    result = false
    br.windows.last.use do
      result =  br.url.include? "sap/public/ap"
    end
    result
  end

end