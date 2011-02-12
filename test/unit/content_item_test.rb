require 'test_helper'

class ContentItemTest < ActiveSupport::TestCase
  test "save new content item" do
     assert Factory.create(:content_item)
  end
end
