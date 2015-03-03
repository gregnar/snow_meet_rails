require 'test_helper'

class Api::V1::GroupsControllerTest < ActionController::TestCase

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
  end

  test "the index action responds with several groups as json" do
    get :index
    assert_equal       'groups', json.keys.first
    assert_instance_of Array,   json['groups']
    assert_instance_of Hash,    json['groups'].first

  end

  test "the show action responds with one group" do
    get :show, id: @group.id
    assert_equal @group.id, json['group']['id']
  end

  test "#update" do
    assert_equal "cool group", @group.name
    update = { name: "the moon" }.to_json
    patch(:update, update, id: @group.id)

    get :show, id: @group.id

    assert_equal "the moon", json['group']['name']

  end

  test "#destroy" do
    initial_count = Group.count
    delete(:destroy, id: @group.id)
    assert_operator Group.count, :<, initial_count
  end

end
