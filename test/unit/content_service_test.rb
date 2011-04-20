require 'test_helper'

class ContentServiceTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "add content" do
     service = ContentService.new

     data = {:name => 'Test content', :content => 'Lorem ipsum...', :tags => 'ruby test'} 

     id  = service.add_content(1,2,data) 
 
     content_item = ContentItem.find(id)
     assert_equal 'Test content', content_item.name
     assert_equal 'Lorem ipsum...', content_item.content
     assert_equal 1, content_item.account_id
     assert_equal 2, content_item.created_by_user_id
     
     tags = content_item.tags_data.collect{ |t| t.name }
     assert tags.find {|tag| tag == 'Ruby'} 
     assert tags.find {|tag| tag == 'test'} 

  end
  
  test "updare content text" do
     service = ContentService.new

     data = {:name => 'Test content', :content => 'Lorem ipsum...', :tags => 'ruby test'} 
     id  = service.add_content(1,2,data) 
     
     content_item = ContentItem.find(id)
     content_item.content = "twinkle twinkle,little star"
     
     
     service.update_content_text(id, "twinkle twinkle,little star", 1)  
     content_item = ContentItem.find(id)
      
     
     assert_equal 'Test content', content_item.name
     assert_equal 'twinkle twinkle,little star', content_item.content
     assert_equal 1, content_item.account_id
     assert_equal 2, content_item.created_by_user_id
     assert_equal 1, content_item.updated_by_user_id

  end
end
