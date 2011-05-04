class PortletsController < ApplicationController
  respond_to :html, :jsom
  def all_tags
     @all_tags_for_current_account = all_tags_for_current_account
     
     respond_to do |format|
       format.html # index.html.erb
       format.json   { render :json => @all_tags_for_current_account}
      end
  end
end
