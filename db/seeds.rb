class Seed
  require 'open-uri'

  def initialize
    generate_groups
    generate_users
    generate_trips
    generate_groups_user_table
    generate_instagrams
    create_demo_user
  end

  def generate_users
    100.times do
      User.create!(twitter_name: Faker::Name.name,
                  insta_name: Faker::Name.name,
                  email: Faker::Internet.email,
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

  def generate_instagrams
    images     = get_images
    user_names = User.all.map {|x| x.insta_name}
    200.times do
      Instagram.create!(image_url: images.sample,
                        caption: Faker::Company.bs,
                        profile_pic: Faker::Company.logo,
                        user_name: user_names.sample,
                        trip_id: Random.rand(100),
                        time_posted: Faker::Time.forward(23, :all).to_i)
    end
    puts "Instagrams Generated"
  end

  def get_images
    doc = Nokogiri::HTML(open("http://www.freedigitalphotos.net/images/search.php?search=winter+nature&exq=&cat%5B%5D=photograph&mt=ALL&lc=0&category_opened=0&gal%5B%5D=292&gal%5B%5D=162&gal%5B%5D=158&gal%5B%5D=160&gal%5B%5D=32&gal%5B%5D=313&gal%5B%5D=66&gal%5B%5D=128&gal%5B%5D=300&gal%5B%5D=38&gal%5B%5D=31&gal%5B%5D=40&gal%5B%5D=288&gal%5B%5D=37&gal%5B%5D=42&gal%5B%5D=41&photog_id=0&or%5B%5D=1&or%5B%5D=2&or%5B%5D=3&people%5B%5D=with&people%5B%5D=without"))
    doc.xpath("//div[contains(@class, 'negative-margin clearfix')]//img").map {|x| x.attribute('src').value}
  end

  def create_demo_user
    user = User.create!(twitter_name: "gregnar",
                        insta_name: Faker::Name.name,
                        email: "demo@demo.com",
                        first_name: Faker::Name.first_name,
                        last_name:  Faker::Name.last_name,
                        password: "password",
                        password_confirmation: "password",
                        )
    10.times { |i| user.groups << Group.find(i + 1) }
  end
end

Seed.new
