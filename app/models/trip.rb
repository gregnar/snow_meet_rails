class Trip < ActiveRecord::Base
  belongs_to :group
  has_many :rsvps
  has_many :users, through: :rsvps
end
