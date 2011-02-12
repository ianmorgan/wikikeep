class LoginController < ApplicationController
   layout :determine_layout
   
   def show
   	render :view => 'show', :layout => 'public'
   end

   def login 
     @user = User.authenticate(params[:user_name], params[:password]) 
     
     if @user 
       session[:user] = @user.attributes
       session[:account] = @user.account.attributes
       redirect_to :controller => 'home', :action => 'index'
     else
       flash[:error] = 'Incorrect email address or password.'
       redirect_to :action => 'show'
     end
   end

   def logout
       session[:user] = nil 
       session[:account] = nil 
       #redirect_to :contraction => 'show'
   end
end
