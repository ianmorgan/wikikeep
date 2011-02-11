class ContentController < ApplicationController
  layout "public"

  def add 
     @content = ContentCommand.new
  end

  def create 
     service = ContentService.new
     #p = ParsingService.new
     result = service.add_content(params[:content_command])
     redirect_to :controller => :content_items, :action => :show, :id => result 
  end 
end
