class CustomersContactsPage < AbstractPage
  include PageObject

  select_list(:record_type, id: 'p3')
  select_list(:salutation, id: 'name_salutationacc2')
  text_field(:first_name, id: 'name_firstacc2')
  text_field(:last_name, id: 'name_lastacc2')
  text_field(:store, xpath: "//label[text()='Store']/ancestor::td/following-sibling::td[1]//input[@type='text']")
  text_field(:mailing_city, id: 'PersonMailingAddresscity')
  text_field(:mailing_country, id: 'PersonMailingAddresscountry')
  text_field(:phone, xpath: "//label[text()='Phone']/ancestor::td/following-sibling::td[1]//input[@type='text']")


  def create_customer
    new_element.when_present.click
    record_type_element.when_present.select 'Person Account'
    continue_element.when_present.click
    salutation_element.when_present.select 'Mr.'
    first_name_element.when_present.send_keys $CUSTOMER_FIRST
    last_name_element.when_present.send_keys $CUSTOMER_LAST
    store_element.when_present.send_keys 'Heathrow Airport T5 London'
    mailing_city_element.when_present.send_keys 'Paris'
    mailing_country_element.when_present.send_keys 'France'
    phone_element.when_present.send_keys '33149527000'
    save_element.click
  end

  text_field(:new_cvm_info, xpath: "//input[@title='New CVM Information']")
  select_list(:customer_type, xpath: "//label[text()='Customer Type']/ancestor::td/following-sibling::td[1]//select")
  text_field(:assigned_sa, xpath: "//label[text()='Assigned SA']/ancestor::td/following-sibling::td[1]//input[@type='text']")
  text_field(:ltv, xpath: "//label[text()='LTV']/ancestor::td/following-sibling::td[1]//input[@type='text']")
  text_field(:reason_code, xpath: "//label[text()='Reason code']/ancestor::td/following-sibling::td[1]//input[@type='text']")
  text_field(:reason_description, xpath: "//label[text()='Reason Description']/ancestor::td/following-sibling::td[1]//input[@type='text']")
  select_list(:status, xpath: "//label[text()='Status']/ancestor::td/following-sibling::td[1]//select")
  text_field(:store_id, xpath: "//label[text()='Store ID(SAP ID)']/ancestor::td/following-sibling::td[1]//input[@type='text']")
  select_list(:tier, xpath: "//label[text()='Tier']/ancestor::td/following-sibling::td[1]//select")
  text_field(:previous_sa_name, xpath: "//label[text()='Previous SA Name']/ancestor::td/following-sibling::td[1]//input[@type='text']")

  def create_cvm_info
    new_cvm_info_element.when_present.click
    customer_type_element.when_present.select 'New'
    assigned_sa_element.when_present.send_keys $USER_1
    ltv_element.when_present.send_keys '1500'
    reason_code_element.when_present.send_keys '04'
    reason_description_element.when_present.send_keys 'Left Business'
    status_element.when_present.select 'Exited'
    store_id_element.when_present.send_keys '1136'
    tier_element.when_present.select 'Classic'
    previous_sa_name_element.when_present.send_keys $USER_2
    save_element.click
  end

  def delete_corporate_gift(item)
    find_corporate_gift(item)
    delete_element.when_present.click
    br.alert.ok
    sleep 2
  end


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