class CreateInstagrams < ActiveRecord::Migration
  def change
    create_table :instagrams do |t|
      t.string :image_url
      t.string :caption
      t.string :profile_pic
      t.string :user_name

      t.timestamps null: false
    end
  end
end
