class ContentController < ApplicationController
  layout "public"

  def add 
     @content = ContentCommand.new
  end

  def create 
     @content = ContentCommand.new(params[:content_command])
     if @content.valid?
     	service = ContentService.new
     	result = service.add_content(params[:content_command])
     	redirect_to :controller => :content_items, :action => :show, :id => result
     else
	render :action => "add" 
     end  
  end 
end
