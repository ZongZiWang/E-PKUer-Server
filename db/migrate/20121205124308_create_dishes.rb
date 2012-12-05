class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :category
      t.float :cost
      t.string :description
      t.float :evaluation

      t.timestamps
    end
  end
end
