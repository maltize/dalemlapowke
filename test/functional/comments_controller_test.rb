require 'test_helper'

class CommentsControllerTest < ActionController::TestCase

  test "should post create" do
    Comment.any_instance.expects(:save).returns(true)

    post :create, :comment => { :bribe_id => bribes(:two).id }

    assert_response :redirect
    assert_redirected_to bribes_path(bribes(:two))
  end

  test "should post create with not validated bribe and fail" do
    Comment.any_instance.expects(:save).never

    post :create, :comment => { :bribe_id => bribes(:one).id }

    assert_response :redirect
    assert_redirected_to bribes_path
  end

  test "should post create and fail" do
    Comment.any_instance.expects(:save).returns(false)

    post :create, :comment => { :bribe_id => bribes(:two).id }

    assert_response :redirect
    assert_redirected_to bribes_path(bribes(:two))
  end

end
