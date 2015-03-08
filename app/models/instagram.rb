class Instagram < ActiveRecord::Base
  belongs_to :trip
  belongs_to :user, foreign_key: :user_name, primary_key: :insta_name
  validates :time_posted, uniqueness: { scope: :user }

  def self.save_instagrams(json, trip_id)
    json['data'].each do |data|
      begin
        create!(image_url: data['images']['standard_resolution']['url'] ,
                caption: data['caption']['text'] ,
                profile_pic: data['user']['profile_picture'],
                user_name: data['user']['username'],
                trip_id: trip_id,
                time_posted:data['created_time'],
               )
      rescue ActiveRecord::RecordInvalid
        next
      end
    end
  end

end
