require 'test_helper'

class BribesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index

    assert_response :success
    assert_not_nil assigns(:bribes)
  end

  test "should get show" do
    bribe = bribes(:two)
    Bribe.expects(:valid).returns(stub(:find => bribe))
    bribe.stubs(:comments).returns(stub(:valid => [], :build => Comment.new))

    get :show, :id => 2
    assert_response :success
    assert_not_nil assigns(:bribe)
    assert_not_nil assigns(:comment)
  end

 test "redirect to index if invalid id" do
    get :show, :id => 'unknown'
    assert_response :redirect
    assert_redirected_to bribes_path
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

  test "should post create and fail" do
    Bribe.any_instance.expects(:save).returns(false)

    post :create, :bribe => {}

    assert_response :success
    assert_template 'new'
  end

end
