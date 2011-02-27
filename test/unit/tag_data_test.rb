require 'test_helper'

class TagDataTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "for account id scope" do
    # relies on data in tag_datas.yml
    assert_equal 3, TagData.for_account_id(1).count
  end

  test "nameds scope" do
    # relies on data in tag_datas.yml
    assert_equal 'Ruby', TagData.named('RUBY').for_account_id(1).first.name
  end
end
