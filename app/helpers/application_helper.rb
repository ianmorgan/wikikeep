module ApplicationHelper

  #duplicate of method on ApplicationController made available views
  def account_name 
    session[:current_user][:account_name]
  end

  #duplicate of method on ApplicationController made available views
  def account_id 
    session[:current_user][:account_id]
  end

end
