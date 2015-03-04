class InstagramServices

  def self.get_instagram_data_in_range(start_date, end_date, user_name)
    uid = get_insta_uid(user_name)
    insta_data = Faraday.get("https://api.instagram.com/v1/users/#{uid}/media/recent/?client_id=#{Figaro.env.client_id}&min_timestamp=#{start_date}&max_timestamp=#{end_date}")
    data = JSON.parse(insta_data.body)
    Instagram.create_insta_data(data)
  end

  def self.get_insta_uid(user_name)
    user_data = Faraday.get("https://api.instagram.com/v1/users/search.json?q=#{user_name}&client_id=#{Figaro.env.client_id}&count=1&format=json")
    JSON.parse(user_data.body)['data'].first['id']
  end
end


    # image_url   = JSON.parse(data.body)['data'].first['images']['low_resolution']['url']
    # caption     = JSON.parse(data.body)['data'].first['caption']['text']
    # profile_pic = JSON.parse(data.body)['data'].first['user']['profile_picture']