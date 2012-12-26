class ChangeRestaurantIdOfDishes < ActiveRecord::Migration
  def up
	  remove_column :dishes, :restaurant_id
	  add_column :dishes, :restaurant_id, :integer
  end

  def down
	  remove_column :dishes, :restaurant_id
	  add_column :dishes, :restaurant_id, :integer, :default => 1
  end
end
