class VolunteerPage < AbstractPage
  include PageObject

  text_field(:set_name, id: 'Name')
  select_list(:activity_category, xpath: "//label[text()='Activity Category']/ancestor::td/following-sibling::td[1]//select")
  text_field(:duration, xpath: "//label[text()='Duration (hours)']/ancestor::td/following-sibling::td[1]//input")
  text_field(:start_date, xpath: "//label[text()='Start Date']/ancestor::td/following-sibling::td[1]//input")
  select_list(:status, xpath: "//label[text()='Status']/ancestor::td/following-sibling::td[1]//select")
  text_field(:volunteer_organization, xpath: "//label[text()='Volunteer Organization']/ancestor::td/following-sibling::td[1]//span/input")
  text_field(:street, xpath: "//label[text()='Street']/ancestor::td/following-sibling::td[1]//input")
  select_list(:region, xpath: "//label[text()='Region']/ancestor::td/following-sibling::td[1]//select")
  select_list(:city_select, xpath: "//label[text()='City']/ancestor::td/following-sibling::td[1]//select")
  select_list(:country, xpath: "//label[text()='Country']/ancestor::td/following-sibling::td[1]//select")

  def create_volunteer_activity
    new_element.when_present.click
    set_name_element.when_present.send_keys $VOLUNTEER_ACTIVITY
    activity_category_element.when_present.select ('Other CI Activity')
    duration_element.send_keys '24'
    start_date_element.send_keys (date_offset_formatted(2, "%d/%m/%Y %H:%M"))
    status_element.select 'Available'
    sleep 2
    frame_one = br.iframe(:xpath => "//iframe[@class='cke_wysiwyg_frame cke_reset']")
    frame_one.element(xpath: "//body").click
    frame_one.element(xpath: "//body").when_present.send_keys 'Auto Volunteer Activity Description'

    volunteer_organization_element.when_present.send_keys $VOLUNTEER_ORGANIZATION
    street_element.send_keys 'Some test street'
    region_element.when_present.select 'EMEIA'
    city_select_element.when_present.select 'London'
    country_element.when_present.select 'United Kingdom'
    save_element.click
    edit_element.when_visible
  end

  text_field(:city, xpath: "//label[text()='City']/ancestor::td/following-sibling::td[1]//input")

  def create_volunteer_organization
    new_element.when_present.click
    set_name_element.when_present.send_keys $VOLUNTEER_ORGANIZATION
    city_element.send_keys 'London'
    country_element.select 'United Kingdom'
    save_element.click
    edit_element.when_visible
  end

end
