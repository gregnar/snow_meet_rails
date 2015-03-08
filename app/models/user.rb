class User < ActiveRecord::Base

  before_save :ensure_authentication_token

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :rsvps
  has_many :groups_users
  has_many :users, through: :rsvps
  has_many :groups, through: :groups_users
  has_many :tweets, foreign_key: :user_name, primary_key: :twitter_name
  has_many :instagrams, foreign_key: :user_name, primary_key: :insta_name

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  private

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end

end
