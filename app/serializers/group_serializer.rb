class GroupSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :name, :description
  has_many :users
  has_many :trips
end
