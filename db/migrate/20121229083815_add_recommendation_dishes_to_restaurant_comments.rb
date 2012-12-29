class AddRecommendationDishesToRestaurantComments < ActiveRecord::Migration
  def change
    add_column :restaurant_comments, :recommendation_dishes, :string
  end
end
