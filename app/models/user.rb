class User < ActiveRecord::Base
  has_secure_password
  has_many :groups_users
  has_many :groups, through: :groups_users
  has_many :rsvps
  has_many :users, through: :rsvps
end
