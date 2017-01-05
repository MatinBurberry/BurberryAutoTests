  class KnowledgePage < AbstractPage
  include PageObject

  select_list(:tier, :id => 'p3')
  button(:continue, :name => 'save', :value => 'Continue')
  text_field(:category_name, :id => 'Name')
  select_list(:type, :xpath => "//label[text()='Type']/../following-sibling::td[1]//select")
  button(:save, :name => 'save', :value => ' Save ')
  button(:new_knowledge_category, xpath: "//input[@title='New Knowledge Category']")
  button(:select_content, value: 'Select Content')
  link(:london_big_ben, text: 'London_BigBen-Night')

  def create_knowledge_category(tier, type)
    if tier == $KNOWLEDGE_CATEGORY_1
      new_element.wait_until_present.click
      tier_element.wait_until_present.select 'Tier 1'
    else
      new_knowledge_category_element.wait_until_present.click
      if tier == $KNOWLEDGE_CATEGORY_2
        tier_element.wait_until_present.select 'Tier 2'
      else
        tier_element.wait_until_present.select 'Tier 3'
      end
    end
    continue_element.wait_until_present.click
    if tier == $KNOWLEDGE_CATEGORY_1
      type_element.wait_until_present.select type
    end
    category_name_element.wait_until_present.send_keys tier
    save_element.wait_until_present.click
    select_content_element.when_present
    if tier == $KNOWLEDGE_CATEGORY_2
      open_windows = br.windows.size
      select_content_element.wait_until_present.click
      wait_for_new_window(open_windows, 30)
      br.window(index: br.windows.size-1).use do
        sleep 3
        london_big_ben_element.wait_until_present.click
      end
      sleep 5
    end
  end

  button(:attach_file, :value => 'Attach File')
  button(:browse, id: 'file')
  button(:attach_selected, :id => 'Attach')
  button(:done, :name => 'cancel', :value => ' Done ')

  def attach_text_file
    attach_file_element.wait_until_present.click
    #browse_element.wait_until_present.send_keys (get_base_dir + 'test_data\policy.txt')
    full_path = get_base_dir + 'test_data\policy.txt'
    br.element(xpath: "//input[@id='file']").wait_until_present.send_keys(full_path)
    #browse_element.wait_until_present.send_keys full_path
    attach_selected_element.wait_until_present.click
    sleep 5
    done_element.wait_until_present.click
  end

  checkbox(:policy, :xpath => "//input[contains(@id,'policyCheckbox')]")
  button(:save_changes, :value => 'Save Changes')

  def create_knowledge_category_hierarchy(type)
    create_knowledge_category $KNOWLEDGE_CATEGORY_1, type
    create_knowledge_category $KNOWLEDGE_CATEGORY_2, type
    create_knowledge_category $KNOWLEDGE_CATEGORY_3, type
  end

  def create_policy
    attach_text_file
  end

  def create_policy_to_accept
    attach_text_file
    policy_element.wait_until_present.set
    sleep 5
    save_changes_element.wait_until_present.click
  end

  def create_knowledge_category_1_2(type)
    create_knowledge_category $KNOWLEDGE_CATEGORY_1, type
    create_knowledge_category $KNOWLEDGE_CATEGORY_2, type
  end

end