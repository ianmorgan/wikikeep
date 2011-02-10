require 'test_helper'

class TagDatasControllerTest < ActionController::TestCase
  setup do
    @tag = tag_datas(:ruby)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tag_datas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tag" do
    assert_difference('TagData.count') do
      post :create, :tag_data => @tag.attributes
    end
    assert_redirected_to tag_data_path(assigns(:tag_data))
  end

  test "should show tag" do
    get :show, :id => @tag.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @tag.to_param
    assert_response :success
  end

  test "should update tag" do
    put :update, :id => @tag.to_param, :tag_data => @tag.attributes
    assert_redirected_to tag_data_path(assigns(:tag_data))
  end

  test "should destroy tag" do
    assert_difference('TagData.count', -1) do
      delete :destroy, :id => @tag.to_param
    end

    assert_redirected_to tag_datas_path
  end
end
