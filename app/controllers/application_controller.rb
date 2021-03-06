class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :prepare_for_mobile

private

  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /Mobile|webOS/
    end
  end
  helper_method :mobile_device?

  def prepare_for_mobile
    session[:mobile_param] = params[:mobile] if params[:mobile]
    request.format = :mobile if mobile_device?
  end

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
      redirect_to login_url 
    end
    if params[:account_name] != session[:current_user][:account_name]
      flash[:error] = "You are not authorised"
      redirect_to login_url 
    end
  end

  def account_name 
    session[:current_user][:account_name]
  end

  def account_id 
    session[:current_user][:account_id]
  end
  
  def user_id 
    session[:current_user][:user_id]
  end
  
  def all_tags_for_current_account
    @all_tags ||= Account.find_by_name(account_name).tag_datas
  end

  def read_content_template(template_name)
     File.new( "#{Rails.root}/content/#{template_name}", "r").read
  end

  def markup_content(content)
     return "" if content.nil?

     r = RedCloth.new content
     r.to_html.html_safe    
   end
   
  helper_method :ie6? , :markup_content
end


