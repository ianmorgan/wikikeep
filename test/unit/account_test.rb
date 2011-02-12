require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  test "create new account" do
     assert Factory.create(:account)
  end

  test "valid_name_pattern" do
     assert Factory.create(:account, :name => 'john_smith99')
  end

  test "name cannot start with underscore" do
     assert_name_fails "_badname" 
  end

  test "name cannot end with underscore" do
     assert_name_fails "badname_" 
  end

  test "name cannot start with numeric" do
     assert_name_fails "1badname" 
  end

  test "name cannot contain punctuation" do
     # todo - should feed ransom bad charcaters into the test
     assert_name_fails "bad$name"
     assert_name_fails "bad.name"
     assert_name_fails "bad,name" 
  end


private 
  def assert_name_fails (name)
     a = Factory.build(:account, :name => name)
     assert_equal false,  a.valid? 
  end
end
