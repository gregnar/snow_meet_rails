class TwitterServices

  attr_reader :client

  def initialize(client=nil)
    @client = client || default_client
  end

  def default_client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = Figaro.env.twitter_key
      config.consumer_secret     = Figaro.env.twitter_secret
    end
  end

  def get_tweets_in_range(user, start_date, end_date)
    client.user_timeline(user, count: 199).select do |tweet|
      tweet.created_at >= start_date && tweet.created_at <= end_date
    end
  end
end
