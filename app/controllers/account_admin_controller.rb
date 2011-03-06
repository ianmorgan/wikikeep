class AccountAdminController < ApplicationController
   layout "admin"
   
   def home
   end

   def test
      render :text => "hello"
   end
end
