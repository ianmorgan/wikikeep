

class TagController < ApplicationController
  layout :determine_layout 
  before_filter :check_account

  def view
    @tag_data = TagData.for_account_id(account_id).find(params[:id])      
  end
end
