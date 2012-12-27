class RemoveUserNameFromDishComments < ActiveRecord::Migration
  def up
    remove_column :dish_comments, :user_name
  end

  def down
    add_column :dish_comments, :user_name, :string
  end
end
