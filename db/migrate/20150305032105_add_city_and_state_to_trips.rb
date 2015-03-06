class AddCityAndStateToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :city, :string
    add_column :trips, :state, :string
  end
end
