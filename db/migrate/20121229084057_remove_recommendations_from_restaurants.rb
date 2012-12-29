class RemoveRecommendationsFromRestaurants < ActiveRecord::Migration
  def up
    remove_column :restaurants, :recommendations
  end

  def down
    add_column :restaurants, :recommendations, :string
  end
end
