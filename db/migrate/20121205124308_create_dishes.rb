class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
	  t.string :image_url
      t.float :evaluation
      t.float :cost
      t.string :category
      t.string :description

      t.timestamps
    end
  end
end
