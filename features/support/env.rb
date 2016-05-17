require 'rspec'
require 'page-object'
require 'data_magic'
require 'require_all'
require 'fig_newton'

require_relative '../../config/data/account'

require_rel 'pages'

World(PageObject::PageFactory)

DataMagic.add_translator(Account)

PageObject.default_page_wait = 60
PageObject.default_element_wait = 60

PageObject.javascript_framework = :jquery


