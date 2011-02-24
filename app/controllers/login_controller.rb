class LoginController < ApplicationController
   layout :determine_layout
   
   def show
     render :view => 'show', :layout => 'public'
   end

   def login 
     @user = User.authenticate(params[:user_name], params[:password]) 
     
     if @user 
       current_user = Hash.new
       current_user[:user_attibutes] = @user.attributes
       current_user[:account_attibutes] = @user.account.attributes
       current_user[:account_name] = @user.account.name
       current_user[:account_id] = @user.account.id

       session[:current_user] = current_user
       redirect_to :controller => 'content', :action => 'home', :account_name => @user.account.name
     else
       flash[:error] = 'Incorrect email address or password.'
       redirect_to :action => 'show'
     end
   end

   def logout
       session[:current_user] = nil  
   end
end
