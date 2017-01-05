class GroupsBurberry20Page < Burberry20Page
  include PageObject

  text_field(:group_name, :id => 'fdnCreateGroup_groupName')
  text_area(:group_description, :id => 'fdnCreateGroup_description')
  radio_button(:public_radio, :id => 'fdnCreateGroup_groupTypePublic')
  radio_button(:private_radio, :id => 'fdnCreateGroup_groupTypePrivate')
  link(:change_thumbnail, :class => 'js-change-thumbnail')
  strong(:create_new_group, xpath: "//div[@id='tab-MyGroups']//strong[text()='Create New Group']")
  strong(:use, xpath: "//strong[text()='Use']")
  strong(:create_group, xpath: "//strong[text()='Create Group']")
  strong(:edit, xpath: "//strong[text()='EDIT']")

  def create_group(group, public)
    create_new_group_element.wait_until_present.click
    sleep 5
    group_name_element.wait_until_present.send_keys group
    group_description_element.wait_until_present.send_keys (group + ' description')
    if public
      public_radio_element.wait_until_present.select
    else
      private_radio_element.wait_until_present.select
    end
    change_thumbnail_element.wait_until_present.click
    use_element.wait_until_present.click
    sleep 3
    create_group_element.wait_until_present.click
    sleep 5
    edit_element.wait_until_present
  end

  li(:media, class: 'media')
  p(:no_results, xpath: "//p[text()='No Results found for your query']")

  def wait_for_filter_result
    begin
      media_element.wait_until_present
    rescue
      no_results_element.wait_until_present
    end
  end

  select_list(:my_groups_filter_select, :xpath => "//div[@id='my-groups-filter']/select")
  select_list(:my_groups_sort_select, :xpath => "//div[@id='my-groups-sort']/select")
  div(:my_group_filter_div, id: 'my-groups-filter')
  div(:my_group_sort_div, id: 'my-groups-sort')

  def select_my_groups_filter(filter_name)
    my_group_filter_div_element.wait_until_present
    my_groups_filter_select_element.select(filter_name)
    wait_for_filter_result
  end

  def select_my_groups_sorting(sort_name)
    my_group_sort_div_element.wait_until_present
    my_groups_sort_select_element.select(sort_name)
    wait_for_filter_result
  end

  select_list(:all_groups_filter_select, :xpath => "//div[@id='all-groups-filter']/select")
  select_list(:all_groups_sort_select, :xpath => "//div[@id='all-groups-sort']/select")
  div(:all_group_filter_div, id: 'all-groups-filter')
  div(:all_group_sort_div, id: 'all-groups-sort')

  def select_all_groups_filter(filter_name)
    all_group_filter_div_element.wait_until_present
    all_groups_filter_select_element.select(filter_name)
    wait_for_filter_result
  end

  def select_all_groups_sorting(sort_name)
    all_group_sort_div_element.wait_until_present
    all_groups_sort_select_element.select(sort_name)
    wait_for_filter_result
  end

  def verify_group_exists(group_name, group, filter, sort)
    select_left_link_containing 'Groups'
    select_left_link_containing group
    if group == 'All Groups'
      select_all_groups_filter filter
      select_all_groups_sorting sort
    else
      select_my_groups_filter filter
      select_my_groups_sorting sort
    end
    begin
      set_implicit_wait(10)
      br.element(link: group_name).exists?
    rescue
      false
    ensure
      set_implicit_wait
    end
  end

  strong(:delete_group, xpath: "//strong[text()='Delete Group']")
  strong(:yes, xpath: "//strong[text()='Yes']")

  def delete_group(group)
    select_left_link_containing 'Groups'
    select_left_link_containing 'My Groups'
    select_my_groups_filter 'All my groups'
    select_my_groups_sorting 'Recently Active'
    br.element(:xpath => "//a[text()='" + group + "']").wait_until_present.click
    edit_element.wait_until_present.click
    sleep 4
    delete_group_element.wait_until_present.click
    yes_element.wait_until_present.click
    create_new_group_element.wait_until_present
  end

  def join_group(group)
    select_left_link_containing 'Groups'
    select_left_link_containing 'All Groups'
    select_all_groups_filter 'Private Groups'
    select_all_groups_sorting 'Recently Active'
    br.element(xpath: "//a[text()='" + group + "']/ancestor::div[@class='cleared']//strong[text()='Ask to Join']").click
  end

  def verify_user_joined_group(group)
    select_left_link_containing 'Groups'
    select_left_link_containing 'All Groups'
    select_all_groups_filter 'Private Groups'
    select_all_groups_sorting 'Recently Active'
    br.element(xpath: "//a[text()='" + group + "']/ancestor::div[@class='cleared']//div[contains(text(),'Membership Requested')]").wait_until_present.exists?
  end

  link(:manage_members, xpath: "//div[@class='modal-inner']//a[text()='Manage Members']")
  span(:close_manage_members, xpath: "//a/span[@class='icn cross-grey99 cross-white-hover']")
  span(:owner_span, xpath: "//span[text()='Owner']")
  li(:notifications, xpath: "//li[@class='menu-item js-notify-dd']")
  link(:conversation, xpath: "//a[@class='conversation']")

  strong(:accept, xpath: "//strong[text()='Accept']")

  def accept_join_to_group_request
    notifications_element.wait_until_present.click
    conversation_element.wait_until_present.click
    accept_element.wait_until_present.click
    sleep 2
    close_manage_members_element.wait_until_present.click
    sleep 2
  end

  strong(:remove, xpath: "//strong[text()='Remove']")

  def verify_user_accepted
    notifications_element.wait_until_present.click
    conversation_element.wait_until_present.click
    manage_members_element.wait_until_present.click
    owner_span_element.wait_until_present
    result = remove_element.exists?
    close_manage_members_element.wait_until_present.click
    result
  end

  strong(:ignore, xpath: "//strong[text()='Ignore']")

  def ignore_join_to_group_request
    notifications_element.wait_until_present.click
    conversation_element.wait_until_present.click
    ignore_element.wait_until_present.click
    sleep 3
    manage_members_element.wait_until_present.click
    owner_span_element.wait_until_present
    begin
      set_implicit_wait(10)
      result = remove_element.exists?
    rescue
      false
    ensure
      set_implicit_wait
    end
    close_manage_members_element.wait_until_present.click
    result
  end

  checkbox(:manager_checkbox, name: 'toggleManager')
  checkbox(:manager_checkbox_checked, name: 'toggleManager', checked: 'checked')

  def make_user_a_manager
    sleep 3
    notifications_element.wait_until_present.click
    conversation_element.wait_until_present.click
    manage_members_element.wait_until_present.click
    manager_checkbox_element.wait_until_present.click
    sleep 3
    close_manage_members_element.wait_until_present.click

  end

  def verify_user_is_a_manager
    sleep 3
    notifications_element.wait_until_present.click
    conversation_element.wait_until_present.click
    manage_members_element.wait_until_present.click
    owner_span_element.wait_until_present
    result = manager_checkbox_checked_element.exists?
    close_manage_members_element.wait_until_present.click
    result
  end

  link(:manage_group_members, text: 'Manage Members')
  link(:add_members, xpath: "//li/a[text()='Add Members']")
  text_field(:search_members, xpath: "//li[@class='tab-add hide']//input[@name='q']")

  def invite_user_to_group(group_name, user)
    select_left_link_containing 'Groups'
    select_left_link_containing 'My Groups'
    select_my_groups_filter 'Private Groups'
    select_my_groups_sorting 'Recently Active'
    br.element(xpath: "//a[text()='" + group_name + "']").wait_until_present.click
    sleep 2
    manage_group_members_element.wait_until_present.click
    add_members_element.wait_until_present.click
    search_members_element.wait_until_present.send_keys user
    search_members_element.wait_until_present.send_keys :enter
    br.element(xpath: "//a[contains(text(), '" + user + "')]/..//strong[text()='Add']").wait_until_present.click
    br.element(xpath: "//a[contains(text(), '" + user + "')]/..//span[text()='Member']").wait_until_present.exists?
  end

  def delete_all_groups(group)
    select_left_link_containing 'Groups'
    select_left_link_containing 'My Groups'
    select_my_groups_filter 'All my groups'
    select_my_groups_sorting 'Recently Active'
    while (br.element(:xpath => "//a[contains(text(),'" + group + "')]").wait_until_present.exists?)
      br.element(:xpath => "//a[contains(text(),'" + group + "')]").wait_until_present.click
      edit_element.wait_until_present.click
      sleep 4
      delete_group_element.wait_until_present.click
      yes_element.wait_until_present.click
      create_new_group_element.wait_until_present
    end

  end

end

