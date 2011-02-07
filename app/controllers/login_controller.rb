class LoginController < ApplicationController
   
   def show
   	render :view => 'show', :layout => 'public'

   end

   def login 
     @user  = User.authenticate(params[:user_name], params[:password]) 
     
     if @user 
       session[:login] = {:user_name => @user.user_name}
       redirect_to :controller => 'home', :action => 'index'
     else
       flash[:notice] = 'Incorrect email address or password.'
       redirect_to :action => 'show'
     end      

   end
end
