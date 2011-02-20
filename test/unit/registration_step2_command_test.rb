require 'test_helper'

class RegistrationStep2CommandTest < ActiveSupport::TestCase
  def setup 
    @command = RegistrationStep2Command.new
  end

  test "validates user name is supplied" do 
     assert @command.valid? == false
     assert field_has_error(@command, :user_name)  
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
