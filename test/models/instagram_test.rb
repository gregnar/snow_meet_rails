require "test_helper"

class InstagramTest < ActiveSupport::TestCase

  def instagram
    @instagram ||= Instagram.new
  end

  def test_valid
    assert instagram.valid?
  end

end
