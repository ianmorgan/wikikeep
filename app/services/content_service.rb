#require "#{Rails.root}/app/services/parsing_service.rb"

class ContentService 

   #
   # Create a new content item in the data
   # plus any tags. 
   #
   def add_content(content)

     content_item = ContentItem.new(:name => content[:name],
           :content => content[:content])
     #tags.split(/[ |,]/)
     tags =  content[:tags].split(/[ |,]/)
  
     tags.each do |tag|  
        tag_data = TagData.find_by_name tag
        unless tag_data 
          tag_data = TagData.new(:name => tag)
          tag_data.save!
        end 
        content_item.tags_data << tag_data
     end
 
     content_item.save
     return content_item.id
   end

end
