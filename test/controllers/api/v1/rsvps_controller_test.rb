require "test_helper"

class Api::V1::RsvpsControllerTest < ActionController::TestCase

    def json
      @json ||= JSON.parse(response.body)
    end

    def setup
      @group = Group.create(name: "cool group")
      @trip  = @group.trips.create( name: "fun trip",
                                    location: "vail",
                                    departure_time: 2.months.ago,
                                    return_time: 1.day.ago,
                                    group_id: 1,
                                  )

      @trip.users << User.create(first_name: "bob", last_name: "smith", email: "bob@bob.com")
      @rsvp = Rsvp.last
    end

    test "the index action responds with several rsvps as json" do
      get :index
      assert_equal       'rsvps', json.keys.first
      assert_instance_of Array,   json['rsvps']
      assert_instance_of Hash,    json['rsvps'].first

    end

    test "the show action responds with one rsvp" do
      get :show, id: @rsvp.id
      assert_equal @rsvp.id, json['rsvp']['id']
    end

    test "#update" do
      assert_equal "no", @rsvp.status
      update = { status: "yes" }.to_json
      patch(:update, update, id: @rsvp.id)

      get :show, id: @rsvp.id

      assert_equal "yes", json['rsvp']['status']

    end

    test "#destroy" do
      initial_count = Rsvp.count
      delete(:destroy, id: @trip.id)
      assert_operator Rsvp.count, :<, initial_count
    end

end
