require 'test_helper'

class ContentItemTest < ActiveSupport::TestCase
  test "save new content item" do
     assert Factory.create(:content_item)
  end

  test "for_account_id scope" do
    count = ContentItem.for_account_id(1).count
    Factory.create(:content_item)
    new_count = ContentItem.for_account_id(1).count
    assert_equal(1, new_count-count)
  end

  test "markedup_content returns html ready for display" do
    content_item = Factory.create(:content_item, :content => "hello *world*")
    assert_equal('<p>hello <strong>world</strong></p>',content_item.markedup_content)
  end
end
