class TweetSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :tweet_id, :user_name, :text, :trip_id, :twitter_time
  has_one :trip
  has_one :user
end
