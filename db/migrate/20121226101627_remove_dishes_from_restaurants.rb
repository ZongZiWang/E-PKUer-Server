class RemoveDishesFromRestaurants < ActiveRecord::Migration
  def up
    remove_column :restaurants, :dishes
  end

  def down
    add_column :restaurants, :dishes, :string
  end
end
