class TripSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :name, :city, :state, :departure_time, :return_time
  has_many :users
  has_many :tweets
  has_one  :group
end
