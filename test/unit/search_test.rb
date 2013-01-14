require 'test_helper'

class SearchTest < ActiveSupport::TestCase

  def test_find
    assert_equal [bribes(:two)], Search.find('long')
  end

end
