class RemoveEvaluationServiceFromRestaurants < ActiveRecord::Migration
  def up
    remove_column :restaurants, :evaluation_service
  end

  def down
    add_column :restaurants, :evaluation_service, :float
  end
end
