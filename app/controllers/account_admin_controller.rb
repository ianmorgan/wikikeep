class AccountAdminController < ApplicationController
   layout "admin"
   
   def home
   end

   def add_user
     @add_user_command = RegistrationStep2Command.new()
   end

   def add_user_complete
     render :text => 'to be implemented'
   end


   def options
   end


   def test
      render :text => "hello"
   end
end
