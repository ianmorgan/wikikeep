class ContentController < ApplicationController
  layout :determine_layout
  before_filter :check_account

  def add 
     @content = ContentCommand.new
  end

  def search
    #renders default search form 
  end

  def dosearch
     # todo - check that search term has been provided
     search_service = SearchService.new
     @results = search_service.search(account_name,params[:q]) 
     render :template => 'content/search_results' 
  end


  def view
     @content_item = ContentItem.find(params[:id]) 
  end

  def home
     @content_items = ContentItem.find(:all) 
  end


  def create 
     @content = ContentCommand.new(params[:content_command])
     if @content.valid?
     	service = ContentService.new
     	result = service.add_content(account_id,params[:content_command])
     	redirect_to  :action => :view, :id => result
     else
	render :action => "add" 
     end  
  end
 
end
