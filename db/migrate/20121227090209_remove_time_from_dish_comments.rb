class RemoveTimeFromDishComments < ActiveRecord::Migration
  def up
    remove_column :dish_comments, :time
  end

  def down
    add_column :dish_comments, :time, :string
  end
end
