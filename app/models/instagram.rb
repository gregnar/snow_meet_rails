class Instagram < ActiveRecord::Base
  belongs_to :trip
  belongs_to :user, foreign_key: :user_name, primary_key: :insta_name

  def self.save_instagrams(json, trip_id)
    binding.pry
    json['data'].each do |data|
      create!(image_url: data['images']['standard_resolution']['url'] ,
              caption: data['caption']['text'] ,
              profile_pic: data['user']['profile_picture'],
              user_name: data['user']['username'],
              trip_id: trip_id,
              time_posted:data['created_time'],
             )
    end
  end

end
