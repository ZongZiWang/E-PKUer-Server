class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :location_name
      t.string :location_zone
      t.float :location_latitude
      t.float :location_longitude
      t.string :category
      t.float :average_cost
      t.string :description
      t.float :evaluation_service
      t.float :evaluation_taste
      t.float :evaluation_environment
      t.string :dishes
      t.string :recommendations
      t.string :info_time
      t.string :info_tel
      t.string :info_summary

      t.timestamps
    end
  end
end
