class Trip < ActiveRecord::Base
  belongs_to :group
  has_many :rsvps
  has_many :instagrams
  has_many :users, through: :rsvps

  after_create :create_rsvp_for_each_user_in_group

  def create_rsvp_for_each_user_in_group
    if group != nil
      group.users.each { |user| rsvps.create(user_id: user.id) }
    end
  end

end