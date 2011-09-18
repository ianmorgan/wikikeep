require 'test_helper'

class RegistrationStep1CommandTest < ActiveSupport::TestCase
  def setup 
     @command = RegistrationStep1Command.new
  end

  test "validates account name is supplied" do 
     assert @command.valid? == false
     assert field_has_error(@command, :account_name)  
  end 

  test "validates account name is at least 6 characters" do
     @command.account_name = 'short' 
     assert @command.valid? == false
     assert field_has_error(@command, :account_name)  
  end

  test "validates account name is no more than 32 characters" do
     @command.account_name = 'dghdghdgsaghgdhdsghgdhgdddhgdhgashjdsggh' 
     assert @command.valid? == false
     assert field_has_error(@command, :account_name)  
  end

  test "validates account name cannot conatin invalid characters" do
     @command.account_name = 'account_name!' 
     assert @command.valid? == false
     assert field_has_error(@command, :account_name)  
  end

  test "validates account name not already in use" do
     Factory.create(:account, :name => 'this_account_is_taken')
     @command.account_name = 'This_account_is_taken' 
     assert @command.valid? == false
     assert field_has_error(@command, :account_name)  
  end


  test "valid account name" do
     @command = RegistrationStep1Command.new :account_name => 'account_name01'
     assert @command.valid?  
  end



  # todo - some reusable test case to be refactored 
  # out into a plugin
  def field_has_error(model, field)
     error_count = 0
     model.errors.each do |f, error| 
         error_count += 1 if f == field.to_sym
     end
     return error_count == 1
  end
 

end
