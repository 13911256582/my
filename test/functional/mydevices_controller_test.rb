require 'test_helper'

class MydevicesControllerTest < ActionController::TestCase
  setup do
    @mydevice = mydevices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mydevices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mydevice" do
    assert_difference('Mydevice.count') do
      post :create, mydevice: @mydevice.attributes
    end

    assert_redirected_to mydevice_path(assigns(:mydevice))
  end

  test "should show mydevice" do
    get :show, id: @mydevice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mydevice
    assert_response :success
  end

  test "should update mydevice" do
    put :update, id: @mydevice, mydevice: @mydevice.attributes
    assert_redirected_to mydevice_path(assigns(:mydevice))
  end

  test "should destroy mydevice" do
    assert_difference('Mydevice.count', -1) do
      delete :destroy, id: @mydevice
    end

    assert_redirected_to mydevices_path
  end
end
