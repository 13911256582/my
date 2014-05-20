require 'test_helper'

class DevicetypesControllerTest < ActionController::TestCase
  setup do
    @devicetype = devicetypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:devicetypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create devicetype" do
    assert_difference('Devicetype.count') do
      post :create, devicetype: @devicetype.attributes
    end

    assert_redirected_to devicetype_path(assigns(:devicetype))
  end

  test "should show devicetype" do
    get :show, id: @devicetype
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @devicetype
    assert_response :success
  end

  test "should update devicetype" do
    put :update, id: @devicetype, devicetype: @devicetype.attributes
    assert_redirected_to devicetype_path(assigns(:devicetype))
  end

  test "should destroy devicetype" do
    assert_difference('Devicetype.count', -1) do
      delete :destroy, id: @devicetype
    end

    assert_redirected_to devicetypes_path
  end
end
