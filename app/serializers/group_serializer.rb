class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  has_many :users
  has_many :trips
end
