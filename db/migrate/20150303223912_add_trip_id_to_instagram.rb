class AddTripIdToInstagram < ActiveRecord::Migration
  def change
    add_column :instagrams, :trip_id, :integer
  end
end
