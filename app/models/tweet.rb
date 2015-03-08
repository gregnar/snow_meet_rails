class Tweet < ActiveRecord::Base
  belongs_to :trip
  belongs_to :user, foreign_key: :user_name, primary_key: :twitter_name

  validates :twitter_time, uniqueness: true

  def self.create_from_api_object(api_object, trip_id)
    create(
      text:         api_object.text,
      trip_id:      trip_id,
      user_name:    api_object.user.screen_name,
      twitter_time: api_object.created_at,
    )
  end

  def self.save_tweets(tweets, trip_id)
    tweets.each do |tweet|
      begin
        create_from_api_object(tweet, trip_id)
      rescue ActiveRecord::RecordNotUnique
        next
      end
    end
  end

end
