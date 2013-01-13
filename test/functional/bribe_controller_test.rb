require 'test_helper'

class BribeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index

    assert_response :success
    assert_not_nil assigns(:bribes)
  end

  test "should get show" do
    bribe = bribes(:one)
    Bribe.expects(:find).returns(bribe)

    get :show, :id => 1
    assert_response :success
    assert_not_nil assigns(:bribe)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:bribe)
  end

  test "should post create" do
    Bribe.any_instance.expects(:save).returns(true)

    post :create, :bribe => {}

    assert_response :redirect
    assert_redirected_to root_path
  end

  test "should get create and fail" do
    Bribe.any_instance.expects(:save).returns(false)

    post :create, :bribe => {}

    assert_response :success
    assert_template 'new'
  end

end
