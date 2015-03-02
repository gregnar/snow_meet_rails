require 'test_helper'

class RsvpSerializerTest < ActiveSupport::TestCase

  def sample_rsvp
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

  def difference_between_desired_and_actual_attributes
    desired_keys - @serialized_rsvp[:rsvp].symbolize_keys.keys
  end

  test "a serialized rsvp has the correct keys" do
    @serialized_rsvp = RsvpSerializer.new(sample_rsvp).as_json
    assert_equal [], difference_between_desired_and_actual_attributes
  end

end
