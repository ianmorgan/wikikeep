require 'test_helper'

class RegistrationServiceTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "create account" do
     service = RegistrationService.new

     attrs = Factory.build(:registration_step1_command).attributes
     attrs = attrs.merge(Factory.build(:registration_step2_command).attributes)
     attrs = attrs.symbolize_keys

     result = service.create_account(attrs)
     assert result

     account = Account.find_by_name attrs[:account_name]
     assert account
     assert_equal 1, account.users.size

     user = account.users.first
     assert_equal attrs[:user_name], user.user_name
     assert_equal attrs[:family_name], user.family_name  
  

  end
end
