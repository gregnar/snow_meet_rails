class InstagramSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :user_name, :image_url, :trip_id, :caption, :profile_pic, :time_posted
  has_one :trip
  has_one :user
end
