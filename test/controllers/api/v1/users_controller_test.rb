require 'test_helper'

class Api::V1::UsersControllerTest < ActionController::TestCase

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

    @user = User.create(first_name: "bob", last_name: "smith", email: "bob@bob.com")
    @trip.users << @user
  end

  test "the index action responds with several groups as json" do
    get :index
    assert_equal       'users', json.keys.first
    assert_instance_of Array,   json['users']
    assert_instance_of Hash,    json['users'].first

  end

  test "the show action responds with one user" do
    get :show, id: @user.id
    assert_equal @user.id, json['user']['id']
  end

  test "#update" do
    assert_equal "bob", @user.first_name
    update = { first_name: "the moon" }.to_json
    patch(:update, update, id: @user.id)

    get :show, id: @user.id

    assert_equal "the moon", json['user']['first_name']

  end

  test "#destroy" do
    initial_count = User.count
    delete(:destroy, id: @user.id)
    assert_operator User.count, :<, initial_count
  end

end
