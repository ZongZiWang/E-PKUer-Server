class RemoveTimeFromRestaurantComments < ActiveRecord::Migration
  def up
    remove_column :restaurant_comments, :time
  end

  def down
    add_column :restaurant_comments, :time, :string
  end
end
