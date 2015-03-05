class RemoveLocationFromTrips < ActiveRecord::Migration
  def change
    remove_column :trips, :location, :string
  end
end
