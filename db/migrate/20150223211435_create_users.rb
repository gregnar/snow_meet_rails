class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :twitter_name
      t.string :insta_name
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :password
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
