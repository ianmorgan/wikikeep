require 'test_helper'

class ContentItemTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "save new content item" do
     content_item  =  Factory.create(:content_item)
     saved = content_item.save  
     assert saved
  end
end
