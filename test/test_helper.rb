ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require File.dirname(__FILE__) + "/factories"  

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :content_items, :tags, :tag_datas, :site_users, :accounts
  set_fixture_class :site_users => User

  # Add more helper methods to be used by all tests here...
end
