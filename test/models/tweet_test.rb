require "test_helper"

class TweetTest < ActiveSupport::TestCase

  def tweet
    @tweet ||= Tweet.new
  end

  def test_valid
    assert tweet.valid?
  end

end
