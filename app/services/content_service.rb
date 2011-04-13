

class ContentService 

   #
   # Create a new content item in the data
   # plus any tags. 
   #
   # Returns the id of the created record
   #
   def add_content(account_id, user_id, content)

     content_item = ContentItem.new(:name => content[:name],
           :content => content[:content])
     content_item.account_id = account_id
     content_item.created_by_user_id = user_id
     tags =  ParsingService.new.parse_tags(content[:tags])
  
     tags.each do |tag|  
        tag_data = TagData.named(tag).for_account_id(account_id).first
        unless tag_data 
          tag_data = TagData.new(:name => tag, :account_id => account_id)
          tag_data.save!
        end 
        content_item.tags_data << tag_data
     end
 
     content_item.save

     search_service = SearchService.new
     search_service.add_content_item content_item 
     
     return content_item.id
   end

   def update_content(content_item_id, content)   
     content_item = ContentItem.find(content_item_id)
     content_item.content = content
     content_item.save

     #todo - must update lucene index
     search_service = SearchService.new
     search_service.add_content_item content_item
   end


end
