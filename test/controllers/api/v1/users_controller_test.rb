require "test_helper"

#{
  #"id": 1,
  #"twitter_name": "IamSomewhatC00l",
  #"insta_name": "IamSomewhatC00l2",
  #"email": "IamSomewhat@example.com",
  #"first_name": "Pat",
  #"last_name": "Mee",
  #"password_digest": "thisisapassword",
  #"groups": [1],
  #"trips": [1]
#},
class Api::V1::UsersControllerTest < ActionController::TestCase
  def test_it_fetches_a_single_user
    user = User.create(twitter_name: "worace",
                       insta_name: "worace",
                       first_name: "worace",
                       last_name: "worace")
    g = Group.create(name: "turing skiers")
    t = Trip.create(name: "gnar shredding", location: "gnar fields of colorado")
    user.trips << t
    user.groups << g

    get :show, id: user.id
    data = JSON.parse(@response.body)
    assert_equal ["user"], data.keys
    user_data = data["user"]
    assert_equal "worace", user_data["twitter_name"]
    assert_equal [g.id], user_data["groups"]
    assert_equal [t.id], user_data["trips"]
  end

  def test_it_fetches_index
    user = User.create(twitter_name: "worace",
                       insta_name: "worace",
                       first_name: "worace",
                       last_name: "worace")
    g = Group.create(name: "turing skiers")
    t = Trip.create(name: "gnar shredding", location: "gnar fields of colorado")
    user.trips << t
    user.groups << g

    User.create(twitter_name: "patmee", insta_name: "patmee", last_name: "mee")

    get :index
    data = JSON.parse(@response.body)
    assert_equal Hash, data.class
    assert_equal ["users"], data.keys
    assert_equal Array, data["users"].class
  end

  def test_it_fetches_batch_users_on_index
    User.create(twitter_name: "worace", insta_name: "worace", first_name: "worace", last_name: "worace")
    u2 = User.create(twitter_name: "patmee", insta_name: "patmee", last_name: "mee")
    u3 = User.create(twitter_name: "gregnar", insta_name: "gregnar", last_name: "gregnar")

    get :index, ids: [u2.id, u3.id]
    data = JSON.parse(@response.body)
    assert_equal [u2.id, u3.id], data["users"].map { |u| u["id"] }
  end
end

