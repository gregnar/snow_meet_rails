require 'test_helper'

class TripTest < ActiveSupport::TestCase

  def setup
    @user  = User.create(first_name: "Joe", last_name: "Taylor", email: "joe@joe.com")
    @group = Group.new(name: "people skiing")
    @group.users << @user
    @group.save!
  end

  def teardown
    DatabaseCleaner.clean
  end

  test "#create_rsvp_for_each_user_in_group is called after #create" do
    @trip = @group.trips.create(name: "great trip", location: "a place")
    assert_equal 1, @trip.rsvps.count
  end

end
