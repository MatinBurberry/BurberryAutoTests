class Burberry20Page < AbstractPage
  include PageObject

  link(:burberry_logo, :title => 'Burberry')

  #def select_left_link_containing(link_name)
  # link_element(:text => link_name).when_present.click
  #end

  def select_left_link_containing(link_name)
    link_element(:xpath => "//a[contains(text(),'" + link_name + "')]").when_present.click
  end

end
