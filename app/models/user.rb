class User < ActiveRecord::Base
  has_many :rsvps
  has_many :trips, through: :rsvps
  has_many :groups_users
  has_many :groups, through: :groups_users

  def as_json(options={})
    user_json = super(options)
    #user_json["user"] = user_json["user"].merge({groups: group_ids, trips: trip_ids})
    user_json
  end

  def group_ids
    groups.pluck(:id)
  end

  def trip_ids
    trips.pluck(:id)
  end
end
