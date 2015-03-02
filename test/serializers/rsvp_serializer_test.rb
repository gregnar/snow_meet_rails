require 'test_helper'

class RsvpSerializerTest < ActiveSupport::TestCase

  def sample_group
    Rsvp.new( user_id: 1,
              trip_id: 1,
              status: "no",
            )
  end

  def desired_keys
    [ :id,
      :status,
      :user_id,
      :trip_id,
    ]
  end

  test "a serialized rsvp has the correct keys" do
    serialized_group = RsvpSerializer.new(sample_group).as_json
    actual_attributes = desired_keys - serialized_group[:rsvp].symbolize_keys.keys
    assert_equal [], actual_attributes
  end

end
