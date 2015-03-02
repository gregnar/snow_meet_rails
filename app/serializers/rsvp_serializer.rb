class RsvpSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :status

  has_one :user
  has_one :trip
end
