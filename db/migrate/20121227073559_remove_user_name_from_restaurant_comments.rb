class RemoveUserNameFromRestaurantComments < ActiveRecord::Migration
  def up
    remove_column :restaurant_comments, :user_name
  end

  def down
    add_column :restaurant_comments, :user_name, :string
  end
end
