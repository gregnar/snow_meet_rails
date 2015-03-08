class Seed


  def initialize
    generate_groups
    generate_users
    generate_trips
    generate_groups_user_table
    create_demo_user
    create_demo_group
    create_demo_trip
  end

  def generate_users
    100.times do
      User.create!( email: Faker::Internet.email,
                    first_name: Faker::Name.first_name,
                    last_name: Faker::Name.last_name,
                    password: "password")
    end
    puts "Users Generated"
  end

  def generate_groups_user_table
    100.times do
      GroupsUser.create!(user_id: Random.rand(100),
                        group_id: Random.rand(50))
    end
    puts "Groups / User Table Generated"
  end

  def generate_groups
    50.times do
      Group.create!(name: Faker::App.name,
                  description: Faker::Company.catch_phrase)
    end
    puts "Groups Generated"
  end

  def generate_trips
    100.times do
      start_date = Faker::Date.forward(23)
      end_date   = start_date + 1
      Trip.create!(name: Faker::Name.name,
                  city: Faker::Address.city,
                  state: Faker::Address.state,
                  departure_time: start_date,
                  return_time: end_date,
                  group_id: Random.rand(45))
    end
    puts "Trips Generated"
  end

  def create_demo_user
    user = User.create!(twitter_name: "gregnar",
                        insta_name: "joerogan",
                        email: "demo@demo.com",
                        first_name: Faker::Name.first_name,
                        last_name:  Faker::Name.last_name,
                        password: "password",
                        password_confirmation: "password",
                        )
    10.times { |i| user.groups << Group.find(i + 1) }
  end

  def create_demo_trip
    group = Group.find_by(name: "Super awesome group")
    group.trips.create!(name: "Fun ski trip!",
                        city: Faker::Address.city,
                        state: Faker::Address.state,
                        departure_time: 5.days.ago,
                        return_time: 1.year.from_now,
                        group_id: Random.rand(45))
  end

  def create_demo_group
    User.last.groups.create!(name: "Super awesome group",
                description: "Fun ski time!")
  end

end




Seed.new
