class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.integer :trip_id
      t.integer :user_id
      t.string :status, default: "no"

      t.timestamps null: false
    end
  end
end
