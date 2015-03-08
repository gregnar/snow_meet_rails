class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :user_name
      t.text :text
      t.integer :trip_id

      t.timestamps null: false
    end
  end
end
