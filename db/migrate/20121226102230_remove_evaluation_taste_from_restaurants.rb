class RemoveEvaluationTasteFromRestaurants < ActiveRecord::Migration
  def up
    remove_column :restaurants, :evaluation_taste
  end

  def down
    add_column :restaurants, :evaluation_taste, :float
  end
end
