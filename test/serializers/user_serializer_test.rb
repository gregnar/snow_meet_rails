require 'test_helper'

class UserSerializerTest < ActiveSupport::TestCase

  def sample_user
    User.new(
              first_name: "Joe",
              last_name: "Taylor",
              email: "joe@joe.com",
              twitter_name: "joseph",
              insta_name: "joseph",
            )
  end


  test "a serialized user has the correct keys" do
    serialized_user = UserSerializer.new(sample_user).as_json
    desired_keys    = [:id,
                       :first_name,
                       :last_name,
                       :twitter_name,
                       :insta_name,
                       :email,
                       :group_ids,
                       :rsvp_ids,
                       ]
    assert_equal [], desired_keys - serialized_user[:user].symbolize_keys.keys
  end

end
