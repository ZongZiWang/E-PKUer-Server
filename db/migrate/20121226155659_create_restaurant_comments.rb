class CreateRestaurantComments < ActiveRecord::Migration
  def change
    create_table :restaurant_comments do |t|
      t.integer :restaurant_id
      t.integer :user_id
      t.string :user_name
      t.float :evaluation
      t.float :cost
      t.string :time
      t.string :content

      t.timestamps
    end
  end
end
