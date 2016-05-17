And(/^I create "([^"]*)" policy$/) do |type|
  on(HomePage).select_tab 'Knowledge Categories'
  on(KnowledgePage).create_knowledge_category_hierarchy type
  on(KnowledgePage).create_policy
end

And(/^I create "([^"]*)" policy which needs user approval$/) do |type|
  on(HomePage).select_tab 'Knowledge Categories'
  on(KnowledgePage).create_knowledge_category_hierarchy type
  on(KnowledgePage).create_policy_to_accept
end

Then(/^I should be able to see in "([^"]*)"$/) do |type|
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'KNOWLEDGE'
  on(Burberry20Page).select_left_link_containing type
  on(KnowledgeBurberry20Page).verify_policy_is_displayed.should be true
end

Then(/^I should be able to accept in "([^"]*)"$/) do |type|
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'KNOWLEDGE'
  on(Burberry20Page).select_left_link_containing type
  on(KnowledgeBurberry20Page).accept_policy.should eql 'Policy accepted'
end

And(/^I create "([^"]*)" knowledge categories 1 & 2$/) do |type|
  on(HomePage).select_tab 'Knowledge Categories'
  on(KnowledgePage).create_knowledge_category_1_2 type
end

Then(/^I should be able to see image in "([^"]*)"$/) do |type|
  on(HomePage).select_app 'Burberry World 2.0'
  on(Burberry20Page).select_left_link_containing 'KNOWLEDGE'
  on(Burberry20Page).select_left_link_containing type
  on(KnowledgeBurberry20Page).verify_knowledge_category_picture.should be true
end