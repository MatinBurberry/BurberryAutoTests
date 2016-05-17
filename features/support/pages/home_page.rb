class HomePage < AbstractPage
  include PageObject

  page_url FigNewton.base_url
  span(:app_launcher, :id => 'tsidLabel')
  img(:all_tabs, :class => 'allTabsArrow', :title => 'All Tabs')

  def select_app(app_name)
    app_launcher_element.when_visible.click
    begin
      br.link(:class => 'menuButtonMenuLink', :text => app_name).click
    rescue

    end
  end

  def select_tab(tab_name)
    all_tabs_element.when_visible.click
    br.img(:title => tab_name).click
    sleep 5
  end

  textarea(:post_area, :id => 'publishereditablearea')
  button(:share, :id => 'publishersharebutton')

  def share_post(post)
    post_area_element.when_visible.click
    br.send_keys post
    share
    br.p(:text => post).wait_until_present
  end

end
