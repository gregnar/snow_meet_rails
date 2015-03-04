class User < ActiveRecord::Base
  has_many :rsvps
  has_many :groups_users
  has_many :users, through: :rsvps
  has_many :groups, through: :groups_users
  has_many :instagrams, foreign_key: :user_name, primary_key: :insta_name

end
