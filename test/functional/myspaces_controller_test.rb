require 'test_helper'

class MyspacesControllerTest < ActionController::TestCase
  setup do
    @myspace = myspaces(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:myspaces)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create myspace" do
    assert_difference('Myspace.count') do
      post :create, myspace: @myspace.attributes
    end

    assert_redirected_to myspace_path(assigns(:myspace))
  end

  test "should show myspace" do
    get :show, id: @myspace
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @myspace
    assert_response :success
  end

  test "should update myspace" do
    put :update, id: @myspace, myspace: @myspace.attributes
    assert_redirected_to myspace_path(assigns(:myspace))
  end

  test "should destroy myspace" do
    assert_difference('Myspace.count', -1) do
      delete :destroy, id: @myspace
    end

    assert_redirected_to myspaces_path
  end
end
