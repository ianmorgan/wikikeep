

class TagController < ApplicationController
  layout :determine_layout 
  before_filter :check_account

  def view
    if params[:id]
      tag_data = TagData.for_account_id(account_id).find(params[:id])      
    else
      tag_data = TagData.for_account_id(account_id).named(params[:name]).first
    end
    if tag_data
      @tag_name = tag_data.name
      @results = [] 
      tag_data.content_items.each do |content_item|
         item = Hash.new
         item['id'] = content_item.id
         item['name'] = content_item.name
         item['tags'] = content_item.tags.each.collect {|t|t.tag_data.name}
         item['summary'] = content_item.content[0..99]
         @results << item
      end
    else
      render :text => 'tag not found'
    end
    #todo - what is no tag?
  end
end
