class ContentController < ApplicationController
  layout :determine_layout

  def add 
     @content = ContentCommand.new
  end

  def search 
     redirect_to :controller => 'home', :action => 'not_implemented' 
  end

  def view
     @content_item = ContentItem.find(params[:id]) 
  end


  def create 
     @content = ContentCommand.new(params[:content_command])
     if @content.valid?
     	service = ContentService.new
     	result = service.add_content(params[:content_command])
     	redirect_to  :action => :view, :id => result
     else
	render :action => "add" 
     end  
  end 
end
