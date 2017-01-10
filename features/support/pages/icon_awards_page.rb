class IconAwardsPage < AbstractPage
  include PageObject

  text_field(:set_name, id: 'Name')

  def create_faq_set
    new_element.when_present.click
    set_name_element.when_present.send_keys $AWARD_FAQ_SET
    save_element.click
    delete_element.when_visible
  end

  text_field(:chat_link_text, id: 'Name')
  text_field(:year, xpath: "//label[text()='Year']/ancestor::td/following-sibling::td[1]//input")
  text_field(:faq_set, xpath: "//label[text()='FAQ Set']/ancestor::td/following-sibling::td[1]/span/input")
  checkbox(:active, xpath: "//label[text()='Active']/ancestor::td/following-sibling::td[1]//input")
  checkbox(:archived, xpath: "//label[text()='Archived']/ancestor::td/following-sibling::td[1]//input")
  checkbox(:show_widget, xpath: "//label[text()='Show Widget']/ancestor::td/following-sibling::td[1]//input")
  text_field(:voting_start_date, xpath: "//label[text()='Voting Start Date']/ancestor::td/following-sibling::td[1]//input")
  text_field(:voting_end_date, xpath: "//label[text()='Voting End Date']/ancestor::td/following-sibling::td[1]//input")

  select(:view, id: 'fcf')
  button(:go, name: 'go')

  def make_award_cycles_inactive_and_not_archived
    view_element.when_present.select 'All'
    go_element.when_present.click
    begin
      set_implicit_wait(5)
      active = br.elements(xpath: "//img[@class='checkImg'][@title='Checked']/../../..//span[text()='Edit']/parent::a")
      active.size.times do
        br.element(xpath: "//img[@class='checkImg'][@title='Checked']/../../..//span[text()='Edit']/parent::a").when_present.click
        active_element.when_present.uncheck
        archived_element.when_present.uncheck
        sleep 1
        save_element.when_present.click
      end
    rescue
      set_implicit_wait
    end
  end

  def create_award_cycle
    new_element.when_present.click
    chat_link_text_element.when_present.send_keys $AWARD_CYCLE
    year_element.send_keys '2016'
    faq_set_element.send_keys $AWARD_FAQ_SET
    active_element.check
    show_widget_element.check
    voting_start_date_element.send_keys date_today
    voting_end_date_element.send_keys date_today
    save_element.click
    delete_element.when_visible
  end

  button(:new_award_category, title: 'New Award Category')
  text_field(:category, id: 'Name')
  button(:upload_thumbnail, name: 'upload_thumbnail')
  button(:upload_winner_image, name: 'upload_image')
  button(:upload, value: 'Upload')

  def create_award_category
    new_award_category_element.when_present.click
    category_element.when_present.send_keys $AWARD_CATEGORY
    save_element.click
    upload_thumbnail_element.when_present.click
    sleep 5
    br.element(xpath: "//input[@type='file']").when_present.send_keys (get_base_dir + 'test_data\qc.jpg')
    upload_element.when_present.click
    upload_winner_image_element.when_present.click
    sleep 5
    br.element(xpath: "//input[@type='file']").when_present.send_keys (get_base_dir + 'test_data\winner.png')
    upload_element.when_present.click
    upload_winner_image_element.when_present
  end

  button(:new_award_region, title: 'New Award Region')
  text_field(:region_name, xpath: "//label[text()='Region Name']/ancestor::td/following-sibling::td[1]//input")
  text_field(:finalists_announced_date, xpath: "//label[text()='Finalists Announced Date']/ancestor::td/following-sibling::td[1]//input")
  text_field(:winners_announced_date, xpath: "//label[text()='Winners Announced Date']/ancestor::td/following-sibling::td[1]//input")

  def create_award_region_finalists(region)
    new_award_region_element.when_present.click
    region_name_element.when_present.send_keys region
    finalists_announced_date_element.send_keys date_offset(-1)
    winners_announced_date_element.send_keys date_offset(2)
    save_element.click
    delete_element.when_visible
  end

  select_list(:status, xpath: "//label[text()='Status']/ancestor::td/following-sibling::td[1]//select")

  def announce_finalist(name)
    br.element(xpath: "//a[@title='Edit - Record 1 - " + name + "']").when_present.click
    status_element.when_present.select('Finalist')
    save_element.when_present.click
    delete_element.when_visible
  end

  def edit_award_region_winners(region)
    br.element(xpath: "//a[@title='Edit - Record 1 - " + region + "']").when_present.click
    winners_announced_date_element.clear
    winners_announced_date_element.send_keys date_offset(-1)
    save_element.click
    delete_element.when_visible
  end

  def announce_winner(name)
    br.element(xpath: "//a[@title='Edit - Record 1 - " + name + "']").when_present.click
    status_element.when_present.select('Winner')
    save_element.when_present.click
    delete_element.when_visible
  end

  def archive_cycle(name)
    find_item(name, 'Award Cycles')
    edit_element.when_present.click
    archived_element.when_present.check
    save_element.when_present.click
  end

end
