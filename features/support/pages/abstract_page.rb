require 'rspec/support'
require 'rspec/matchers'

class AbstractPage
  include PageObject

  def br
    @browser
  end

  button(:new, name: 'new')
  text_field(:search_field, :id => 'phSearchInput')
  button(:find, id: 'phSearchButton')
  button(:save, name: 'save')
  button(:continue, name: 'save')
  button(:delete, title: 'Delete')
  button(:edit, name: 'edit')

  def date_today
    date_today = Date.today
    date_today.strftime("%d/%m/%Y")
  end

  def date_today_formatted(format)
    date_today = Date.today
    date_today.strftime(format)
  end

  def date_offset(offset)
    date_today = Date.today + offset.to_i
    date_today.strftime("%d/%m/%Y")
  end

  def date_offset_formatted(offset, format)
    date_today = Date.today + offset.to_i
    date_today.strftime format
  end

  link(:search_all, id: "searchAllSummaryView")

  def find_item(item, category)
    search_field_element.when_present.send_keys item
    find_element.when_present.click
    begin
      br.element(xpath: "//span[contains(text(),'" + category + "')]/ancestor::div[@class='bPageBlock brandSecondaryBrd secondaryPalette']//a[contains(text(), '" + item + "')]").when_present.click
    rescue
      search_all_element.when_present.click
      br.element(xpath: "//span[contains(text(),'" + category + "')]/ancestor::div[@class='bPageBlock brandSecondaryBrd secondaryPalette']//a[contains(text(), '" + item + "')]").when_present.click
    end
  end

  def find_and_delete_item(item, category)
    find_item(item, category)
    delete_element.when_present.click
    br.alert.ok
    sleep 2
  end

  def go_to_salesforce
    sleep 2
    if br.url.include? '/apex/'
      url = br.url.split(/apex/)
      br.goto url[0]
    end
  end

  def get_base_dir
    base_dir = File.dirname(__FILE__).split(/features/)
    base_dir[0].gsub('/', '\\')
  end

  def wait_for_new_window(open_windows, seconds)
    count = 0
    until (br.windows.size > open_windows) || (count >= seconds) do
      count += 1
      sleep 1
    end
  end

  def set_implicit_wait(seconds = $DEFAULT_IMPLICIT_WAIT)
    @browser.driver.manage.timeouts.implicit_wait = seconds
  end

  def log_deletion_warning(object)
    File.open("results/deletion_warnings.txt", 'a') { |f| f.write(Time.now.strftime("%d/%m/%Y %H:%M:%S") + " - " + object + " was not deleted\n") }
  end


  def deleteItems(link, nameContains)
    br.goto link
    begin
      set_implicit_wait 10
      while (br.element(xpath: "//span[contains(text(),'" + nameContains + "')]/ancestor::tr[1]//span[text()='Del']").when_present(10).exists?)
        br.element(xpath: "//span[contains(text(),'" + nameContains + "')]/ancestor::tr[1]//span[text()='Del']").when_present.click
        br.alert.ok
        sleep 2
      end
    rescue
    ensure
      set_implicit_wait
    end

  end

end