# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  bribe_id     :integer          not null
#  comment      :text             default(""), not null
#  user         :string(255)
#  validated_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  setup do
    @comment = comments(:one)
  end

  test "valid" do
    assert @comment.valid?
  end

  test "should valid presence of fields" do
    @comment.comment = nil

    deny @comment.valid?
    assert @comment.errors[:comment]
  end

  test "valid!" do
    assert_nil @comment.validated_at

    @comment.valid!

    assert @comment.validated_at
  end

  test "valid scope" do
    assert_equal [ bribes(:two) ], Bribe.valid
  end

  test "user= should set md5 value" do
    @comment.user = "192.168.1.1"

    assert_equal "66efff4c945d3c3b87fc271b47d456db",
      @comment.user
  end

  test "bribe" do
    @comment.bribe = bribes(:one)

    assert_equal bribes(:one), @comment.bribe
  end

end
