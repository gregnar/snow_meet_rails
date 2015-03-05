class User < ActiveRecord::Base
  require "securerandom"
  has_secure_password
  has_many :groups_users
  has_many :groups, through: :groups_users
  has_many :rsvps
  has_many :users, through: :rsvps

  def generate_token!
    unless authentication_token
      token = SecureRandom.uuid
      while User.find_by(authentication_token: token)
        token = SecureRandom.uuid
      end
      self.authentication_token = token
      save
    end
  end
end
