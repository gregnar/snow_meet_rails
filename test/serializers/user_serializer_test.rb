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

  def desired_keys
    [ :id,
      :first_name,
      :last_name,
      :twitter_name,
      :insta_name,
      :email,
      :group_ids,
      :rsvp_ids,
    ]
  end

  def difference_between_desired_and_actual_attributes
    desired_keys - @serialized_user[:user].symbolize_keys.keys
  end

  test "a serialized user has the correct keys" do
    @serialized_user = UserSerializer.new(sample_user).as_json
    assert_equal [], difference_between_desired_and_actual_attributes
  end

end
