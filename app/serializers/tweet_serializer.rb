class TweetSerializer < ActiveModel::Serializer
  embed :ids

  attributes :tweet_id, :user_name, :text, :trip_id, :twitter_time
  belongs_to :trip
  belongs_to :user
end
