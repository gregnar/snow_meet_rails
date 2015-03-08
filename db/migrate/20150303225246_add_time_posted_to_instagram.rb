class AddTimePostedToInstagram < ActiveRecord::Migration
  def change
    add_column :instagrams, :time_posted, :string
  end
end
