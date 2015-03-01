class TripSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :name, :location, :departure_time, :return_time
  has_many :users
  has_one  :group
end
