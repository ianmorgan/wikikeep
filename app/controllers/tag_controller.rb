

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
         created_by=Hash.new
         created_by[:name] = content_item.created_by.nick_name
         created_by[:date] = content_item.created_at
         item[:created] = created_by
         if content_item.updated_by
            updated_by=Hash.new
            updated_by[:name] = content_item.updated_by.nick_name
            updated_by[:date] = content_item.updated_at
            item[:updated] = updated_by
         end
         item[:last_modified] = item[:updated] || item [:created]
   
         
         @results << item
      end
    else
      render :text => 'tag not found'
    end
      #todo - what is no tag?
  end
  
end
