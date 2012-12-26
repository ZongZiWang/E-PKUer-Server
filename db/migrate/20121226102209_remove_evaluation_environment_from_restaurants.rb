class RemoveEvaluationEnvironmentFromRestaurants < ActiveRecord::Migration
  def up
    remove_column :restaurants, :evaluation_environment
  end

  def down
    add_column :restaurants, :evaluation_environment, :float
  end
end
