class Trip < ActiveRecord::Base
  belongs_to :group
  has_many :rsvps
  has_many :users, through: :rsvps
  has_many :tweets
  has_many :instagrams

  after_create :create_rsvp_for_each_user_in_group

  def create_rsvp_for_each_user_in_group
    if group != nil
      group.users.each { |user| rsvps.create(user_id: user.id) }
    end
  end

  def update_tweets
    users.each do |user|
      if user.twitter_name.present?
        new_tweets = TwitterServices.new.get_tweets_in_range(format_user(user), format_time(departure_time), format_time(return_time))
        Tweet.save_tweets(new_tweets, id)
      end
    end
  end

  def format_user(user)
    user.twitter_name
  end

  def format_time(time)
    time.strftime("%Y-%d-%m")
  end

  def update_instagrams
    users.each do |user|
      if user.insta_name.present?
        new_instagrams = InstagramServices.get_instagram_data_in_range(user.insta_name, departure_time, return_time)
        Instagram.save_instagrams(new_instagrams, id)
      end
    end
  end

  def update_social_media
    update_instagrams
    update_tweets
  end
end
