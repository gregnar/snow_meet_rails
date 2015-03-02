require 'test_helper'

class TripSerializerTest < ActiveSupport::TestCase

  def sample_trip
    Trip.new( name: "fun trip",
              location: "vail",
              departure_time: 2.months.ago,
              return_time: 1.day.ago,
              group_id: 1,
            )
  end

  def setup
    sample_trip.users << User.new(  first_name: "bob",
                                    last_name: "smith",
                                    email: "bob@bob.com",
                                  )
  end

  def desired_keys
    [ :id,
      :name,
      :location,
      :departure_time,
      :return_time,
      :user_ids,
      :group_id
    ]
  end

  def difference_between_desired_and_actual_attributes
    desired_keys - @serialized_trip[:trip].symbolize_keys.keys
  end

  test "a serialized trip has the correct keys" do
    @serialized_trip = TripSerializer.new(sample_trip).as_json
    assert_equal [], difference_between_desired_and_actual_attributes
  end

end
