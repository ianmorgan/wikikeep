

class TagController < ApplicationController
  layout :determine_layout 

  def view
    @tag_data = TagData.find(params[:id])      
  end
end
