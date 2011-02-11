require 'test_helper'

class ParsingServiceTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "parse tags" do
     service = ParsingService.new

     assert_equal ['one','two'],service.parse_tags('one two')
     assert_equal ['one','two','three'],service.parse_tags('one,two three')

  end
end
