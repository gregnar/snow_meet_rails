class Seed

  def initialize
    generate_trips
  end

  def generate_trips
    Trip.create!(name: ,
                location: ,
                departure_time: ,
                return_time: ,
                group_id: )
  end

end


  create_table "trips", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "departure_time"
    t.datetime "return_time"
    t.integer  "group_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end