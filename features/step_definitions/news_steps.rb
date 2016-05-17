And(/^I should publish public news story$/) do
  on(HomePage).select_tab 'News Stories'
  on(NewsPage).create_news_story(true, false, false)
end

Then(/^I should see public news story$/) do
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'News'
  on(NewsBurberry20Page).verify_news($NEWS_HEADLINE).should be true
end

And(/^I should publish public featured news story$/) do
  on(HomePage).select_tab 'News Stories'
  on(NewsPage).create_news_story(true, true, false)
end

Then(/^I should see public featured news story$/) do
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'Dashboard'
  on(NewsBurberry20Page).verify_featured_story($NEWS_HEADLINE).should be true
end

And(/^I should publish public news story with Chat$/) do
  on(HomePage).select_tab 'News Stories'
  on(NewsPage).create_news_story(true, false, true)
end

Then(/^I should be able to chat$/) do
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'News'
  on(NewsBurberry20Page).verify_news_chat($NEWS_HEADLINE).should be true
end

Then(/^I should see public news story with Tag$/) do
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'News'
  on(NewsBurberry20Page).verify_news_tag($NEWS_HEADLINE, 'auto test').should be true
end

Then(/^I should be able to like news story$/) do
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'News'
  on(NewsBurberry20Page).verify_like_news_story($NEWS_HEADLINE).should eql '1'
end

Then(/^I should be able to see likes list$/) do
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'News'
  on(NewsBurberry20Page).verify_like_list($NEWS_HEADLINE).should be true
end

Then(/^I should be able to see follow news story$/) do
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'News'
  on(NewsBurberry20Page).follow_news_story($NEWS_HEADLINE).should be true
  on(Burberry20Page).select_left_link_containing 'News'
  on(NewsBurberry20Page).verify_news_chat($NEWS_HEADLINE)
  on(Burberry20Page).select_left_link_containing 'Dashboard'
  on(NewsBurberry20Page).verify_following_news_story($NEWS_TITLE).should be true
end
