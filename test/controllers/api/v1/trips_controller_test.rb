require 'test_helper'

class Api::V1::TripsControllerTest < ActionController::TestCase

  def json
    @json ||= JSON.parse(response.body)
  end

  def setup
    @group = Group.create(name: "cool group")
    @trip = @group.trips.create(
                name: "fun trip",
                location: "vail",
                departure_time: 2.months.ago,
                return_time: 1.day.ago,
                group_id: 1,
                )

    @trip.users << User.create(first_name: "bob", last_name: "smith", email: "bob@bob.com")
  end

  test "the index action responds with several trips as json" do
    get :index
    assert_equal       'trips', json.keys.first
    assert_instance_of Array,   json['trips']
    assert_instance_of Hash,    json['trips'].first

  end

  test "the show action responds with one trip" do
    get :show, id: @trip.id
    assert_equal @trip.id, json['trip']['id']
  end


end
