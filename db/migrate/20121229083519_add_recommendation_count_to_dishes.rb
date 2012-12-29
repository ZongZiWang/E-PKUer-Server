class AddRecommendationCountToDishes < ActiveRecord::Migration
  def change
    add_column :dishes, :recommendation_count, :integer, :default => 0
  end
end
