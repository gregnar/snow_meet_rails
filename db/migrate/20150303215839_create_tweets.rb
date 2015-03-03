class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :twitter_id
      t.string :user_name
      t.text :text
      t.datetime :created_at

      t.timestamps null: false
    end
  end
end
