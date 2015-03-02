require 'test_helper'

class GroupSerializerTest < ActiveSupport::TestCase

  def sample_group
    Group.new(
              name: "Joe's Gropu",
              description: "Taylor stuff",
            )
  end

  def desired_keys
    [ :id,
      :name,
      :description,
      :user_ids,
      :trip_ids,
    ]
  end

  test "a serialized group has the correct keys" do
    serialized_group = GroupSerializer.new(sample_group).as_json
    actual_attributes = desired_keys - serialized_group[:group].symbolize_keys.keys
    assert_equal [], actual_attributes
  end

end
