require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  test "should get the home page" do
    get :index
    assert_response :success
    
  end
end
