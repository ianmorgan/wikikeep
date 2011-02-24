

class TagController < ApplicationController
  layout :determine_layout 
  before_filter :check_account

  def view
    @tag_data = TagData.find(params[:id])      
  end
end
