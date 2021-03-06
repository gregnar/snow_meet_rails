class UserSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :twitter_name, :insta_name, :first_name, :last_name, :email
  has_many :groups
  has_many :rsvps
end
