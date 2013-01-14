require 'test_helper'
require 'will_paginate/array'

class SearchControllerTest < ActionController::TestCase

  test "should get find" do
    bribe = bribes(:one)
    Search.expects(:find).returns([bribe])

    get :find, :query => 'long'

    assert_response :success
    assert_not_nil assigns(:bribes)
  end

end
