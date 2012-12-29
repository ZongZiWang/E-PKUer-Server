class ChangeTypesForDishes < ActiveRecord::Migration
  def up
	  change_column :dishes, :image_url, :string, default: '404.png'
      change_column :dishes, :evaluation, :float, default: 5
      change_column :dishes, :cost, :float, default: 5
	  change_column :dishes, :category, :string, default: 'Normal'
      change_column :dishes, :description, :string, default: 'Recommended'
  end

  def down
	  change_column :dishes, :image_url, :string
      change_column :dishes, :evaluation, :float
      change_column :dishes, :cost, :float
	  change_column :dishes, :category, :string
      change_column :dishes, :description, :string
  end
end
