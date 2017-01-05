class ConnectBurberry20Page < Burberry20Page
  include PageObject

  strong(:raise_a_new_case, xpath: "//strong[text()='Raise a new Case']")
  select_list(:type, xpath:"//label[text()='Type*']/parent::div//select")
  select_list(:sub_type, xpath:"//label[text()='Sub-Type*']/parent::div//select")
  text_field(:subject, xpath:"//label[text()='Subject*']/parent::div//input")
  text_area(:description, xpath:"//label[text()='Description*']/parent::div//textarea")
  strong(:submit, xpath: "//strong[text()='Submit']")

  def raise_new_case(type, sub_type)
    sleep 5
    raise_a_new_case_element.wait_until_present.click

    subject_element.wait_until_present

    type_element.select type
    sub_type_element.select sub_type

    subject_element.wait_until_present.send_keys $HR_CASE
    description_element.wait_until_present.send_keys 'Auto HR description'
    submit_element.wait_until_present.click

    br.element(xpath: "//dd[text()='" + $HR_CASE + "']").wait_until_present
    br.element(xpath: "//dd[text()='" + $HR_CASE + "']/parent::dl/dd/em").text
  end

  element(:case_status, "dd", xpath: "//dd[@class='case-status']")

  def get_hr_case_status(case_number)
    br.element(xpath: "//em[text()='" + case_number + "']").wait_until_present.click
    case_status_element.wait_until_present
    case_status_element.text
  end

end