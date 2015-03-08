class AddTwitterTimeToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :twitter_time, :datetime
  end
end
