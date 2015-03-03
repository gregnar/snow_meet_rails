require 'test_helper'

class TwitterServicesTest < ActiveSupport::TestCase
  test "it can get tweets from a particular user within a certain date range" do

    twitter = TwitterServices.new
    tweets_in_range = twitter.get_tweets_in_range("j3", 1.month.ago, 1.day.ago)
    binding.pry
    assert tweets_in_range.first.created_at <= 1.day.ago
    refute tweets_in_range.first.created_at >= 1.day.ago
    assert tweets_in_range.last.created_at  >= 1.month.ago
    refute tweets_in_range.last.created_at  <= 1.month.ago
  end
end
