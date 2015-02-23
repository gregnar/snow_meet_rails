class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
      t.string :location
      t.datetime :departure_time
      t.datetime :return_time
      t.integer :group_id

      t.timestamps null: false
    end
  end
end
