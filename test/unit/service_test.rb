# encoding: UTF-8
require 'test_helper'

class ServiceTest < Test::Unit::TestCase

  def test_find
    srvc = Service.find(6)

    assert srvc.is_a?(Service)
    assert_equal 6, srvc.id
    assert_equal "Policja", srvc.title
  end

  def test_find_return_nil_if_record_not_found
    assert_nil Service.find(1024)
  end

  def test_all
    srvcs = Service.all

    assert srvcs.is_a?(Array)
    assert srvcs[0].is_a?(Service)
  end

  def test_options
    options = Service.options

    assert options.is_a?(Array)
    assert options[0].is_a?(Array)
    assert options[0][0].is_a?(String)
    assert options[0][1].is_a?(Fixnum)
  end

end
