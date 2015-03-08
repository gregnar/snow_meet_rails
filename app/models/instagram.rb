class Instagram < ActiveRecord::Base
  belongs_to :trip
  belongs_to :user, foreign_key: :user_name, primary_key: :insta_name

  def self.create_insta_data(json)
    binding.pry
    json['data'].each do |data|
      Instagram.create!(image_url: data['images']['standard_resolution']['url'] ,
                        caption: data['caption']['text'] ,
                        profile_pic: data['user']['profile_picture'],
                        user_name: data['user']['username'])
    end
  end
end