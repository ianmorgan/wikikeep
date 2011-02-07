class ApplicationController < ActionController::Base
  protect_from_forgery

private  
  def ie6?  
     request.user_agent =~ /MSIE 6.0/  
  end  
  helper_method :ie6?  
end
