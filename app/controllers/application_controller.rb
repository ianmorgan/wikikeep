class ApplicationController < ActionController::Base
  protect_from_forgery

private
  def determine_layout 
    is_logged_in? ? "loggedin" : "public"
  end

  def is_logged_in?
    session[:current_user] 
  end
  
  def ie6?  
     request.user_agent =~ /MSIE 6.0/  
  end

  def check_account
    unless is_logged_in?
      flash[:error] = "You must be logged in"
      redirect_to login_url # halts request cycle
    end
    if params[:account_name] != session[:current_user][:account_name]
      flash[:error] = "You are not authorised"
      redirect_to login_url # halts request cycle
    end
  end

  def account_name 
    session[:current_user][:account_name]
  end

   
  helper_method :ie6?  
end


