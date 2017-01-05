class KnowledgeBurberry20Page < Burberry20Page
  include PageObject

  link(:accept_policy, :text => 'Accept Policy')
  link(:policy_accepted, :text => 'Policy accepted')

  def accept_policy
    br.element(:xpath => "//strong[text()='" + $KNOWLEDGE_CATEGORY_2 + "']").wait_until_present.click
    verify_policy
    accept_policy_element.wait_until_present.click
    br.element(:xpath => "//strong[text()='Accept Policy']").wait_until_present.click
    policy_accepted_element.wait_until_present.text
  end

  def verify_policy_is_displayed
    br.element(:xpath => "//strong[text()='" + $KNOWLEDGE_CATEGORY_2 + "']").wait_until_present.click
    verify_policy
  end

  link(:policy_file, xpath: "//a[@data-filename='policy.txt']")

  def verify_policy
    open_windows = br.windows.size
    policy_file_element.wait_until_present.click
    wait_for_new_window(open_windows, 30)
    result = false
    br.window(index: br.windows.size-1).use do
      result = br.element(xpath: "//pre[text()='Automation test policy text']").wait_until_present.exists?
      br.window.close
    end
    result
  end

  def verify_knowledge_category_picture
    br.element(xpath: "//strong[text()='" + $KNOWLEDGE_CATEGORY_2 + "']").wait_until_present
    sleep 10
    result = br.execute_script("return (typeof arguments[0].naturalWidth!=\"undefined\" && arguments[0].naturalWidth>0)", br.image(xpath: "//strong[text()='" + $KNOWLEDGE_CATEGORY_2 + "']/..//img"))
    br.element(xpath: "//strong[text()='" + $KNOWLEDGE_CATEGORY_2 + "']").wait_until_present.click
    br.element(xpath: "//img[@alt='" + $KNOWLEDGE_CATEGORY_2 + "']").wait_until_present
    sleep 10
    result && br.execute_script("return (typeof arguments[0].naturalWidth!=\"undefined\" && arguments[0].naturalWidth>0)", br.image(xpath: "//img[@alt='" + $KNOWLEDGE_CATEGORY_2 + "']"))
  end

end
