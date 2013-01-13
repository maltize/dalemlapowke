# == Schema Information
#
# Table name: bribes
#
#  id           :integer          not null, primary key
#  kind         :integer          not null
#  area         :integer          not null
#  service      :integer          not null
#  when         :date             not null
#  amount       :decimal(9, 2)    not null
#  subject      :string(255)      not null
#  description  :text
#  user         :string(255)
#  validated_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class BribeTest < ActiveSupport::TestCase

  setup do
    @bribe = bribes(:one)
  end

  test "valid" do
    assert @bribe.valid?
  end

  test "should valid presence of fields" do
    @bribe.kind = nil

    deny @bribe.valid?
    assert @bribe.errors[:kind]
  end

  test "valid!" do
    assert_nil @bribe.validated_at

    @bribe.valid!

    assert @bribe.validated_at
  end

  test "valid scope" do
    assert_equal [ bribes(:two) ], Bribe.valid
  end

  test "user= should set md5 value" do
    @bribe.user = "192.168.1.1"

    assert_equal "66efff4c945d3c3b87fc271b47d456db",
      @bribe.user
  end

end
