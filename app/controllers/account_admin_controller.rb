class AccountAdminController < ApplicationController
   layout :determine_layout
   
   def home
   end

   def test
      render :text => "hello"
   end
end
