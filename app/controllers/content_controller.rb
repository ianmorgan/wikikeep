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
     render :template => 'content/search_results' 
  end


  def view
     @content_item = ContentItem.for_account_id(account_id).find(params[:id])
     @content_item.content.html_safe 
  end

  def home
     @content_items = ContentItem.for_account_id(account_id).find(:all) 
  end


 
end
