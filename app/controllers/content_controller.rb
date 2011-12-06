# Main content controller 
# 
#
class ContentController < ApplicationController
  layout :determine_layout
  before_filter :check_account

  def add 
    redirect_to :controller => 'add_content', :action => 'start'
  end

  def search
    #renders default search form 
  end

  def dosearch
     # todo - check that search term has been provided
     search_service = SearchService.new
     @results = search_service.search(account_name,params[:q]) 
     puts @results
     render :template => 'content/search_results' 
  end


  def edit
     @content_item = ContentItem.for_account_id(account_id).find(params[:id])
     @content_item.content.html_safe 

     @update_content_command = UpdateContentCommand.new(:id => @content_item.id, :content => @content_item.content)
  end

  def update 
     submitted = params[:update_content_command]
     @update_content_command = UpdateContentCommand.new(submitted)
     if @update_content_command.valid? 
        service = ContentService.new
        result = service.update_content_text(params[:id],@update_content_command.attributes[:content],user_id)
        redirect_to  :account_name => account_name, :controller => 'content', :action => 'view', :id => params[:id]
     end
  end
  
  def view
     @content_item = ContentItem.for_account_id(account_id).find(params[:id])
     @content_item.content.html_safe 
  end


  def home
    #todo - should move to home controller ?
    @user = User.find(user_id)
    if @user.viewed_welcome_page
       @recent_items = ContentItem.for_account_id(account_id).recent
    else
       redirect_to :action => 'welcome' 
    
    end
  end
  
  def welcome
    user = User.find(user_id)
    user.viewed_welcome_page = true
    user.save!
    
    @content = read_content_template('welcome')
    
  end


 
end
