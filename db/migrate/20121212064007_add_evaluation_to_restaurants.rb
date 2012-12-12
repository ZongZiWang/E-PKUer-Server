class AddEvaluationToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :evaluation, :string
  end
end
