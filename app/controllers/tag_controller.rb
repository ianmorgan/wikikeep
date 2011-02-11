

class TagController < ApplicationController
  layout "public"

  def view
    @tag_data = TagData.find(params[:id])      
  end
end
