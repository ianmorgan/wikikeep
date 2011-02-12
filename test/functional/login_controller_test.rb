require 'test_helper'

class LoginControllerTest < ActionController::TestCase
  fixtures :site_users  
  set_fixture_class :site_users => User

  setup do
    @user = site_users(:demo)
  end

  test "should show login page" do
    get :show 
    assert_response :success
  end

  test "successful login" do
    post :login, {:user_name => 'demo@example.com', :password => 'password'} 
    assert_response :redirect
    #assert_redirected_to  
  end

end
