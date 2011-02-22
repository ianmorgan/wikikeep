require 'test_helper'

class RegistrationStep2CommandTest < ActiveSupport::TestCase
  def setup 
    @command = Factory.build(:registration_step2_command)
  end

  test "validates user name is supplied" do
     @command.user_name = nil 
     assert @command.valid? == false
     assert field_has_error(@command, :user_name)  
  end

  test "validates password is supplied" do
     @command.password = nil 
     assert @command.valid? == false
     assert field_has_error(@command, :password)  
  end

  test "validates passwords match" do
     @command.password = "password1"
     @command.password_confirmation = "password2" 
     assert @command.valid? == false
     assert field_has_error(@command, :password)  
  end

  test "valid command passes validation" do
     @command = Factory.build(:registration_step2_command)  
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
